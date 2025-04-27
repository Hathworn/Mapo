#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = (int)px;
    int ty = (int)py;
    float value = src[image_row_offset + j];

    float weights[4];
    int txs[4] = {tx, tx-1, tx-1, tx};
    int tys[4] = {ty, ty, ty-1, ty-1};

    // Pre-calculate weights
    weights[0] = dx * dy;
    weights[1] = (1.0f - dx) * dy;
    weights[2] = (1.0f - dx) * (1.0f - dy);
    weights[3] = dx * (1.0f - dy);

    // Loop to handle atomic addition for four corners
    for (int k = 0; k < 4; k++)
    {
        if (txs[k] >= 0 && txs[k] < w && tys[k] >= 0 && tys[k] < h)
        {
            int idx = tys[k] * image_stride + txs[k];
            float weight = weights[k];
            _atomicAdd(dst + idx, value * weight);
            _atomicAdd(normalization_factor + idx, weight);
        }
    }
}