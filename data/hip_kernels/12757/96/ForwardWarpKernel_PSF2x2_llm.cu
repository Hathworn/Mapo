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
    
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Precompute scaled coordinates
    float cx = u[flow_row_offset + j] * time_scale + j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + i + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = (int) px;
    int ty = (int) py;
    float value = src[image_row_offset + j];
    float weight;

    // Check bounds once using a combined condition
    #pragma unroll
    for (int k = 0; k < 4; ++k) {
        if (!(tx < 0 || tx >= w || ty < 0 || ty >= h)) {
            switch (k) {
                case 0: weight = dx * dy; break;
                case 1: weight = (1.0f - dx) * dy; tx -= 1; break;
                case 2: weight = (1.0f - dx) * (1.0f - dy); ty -= 1; break;
                case 3: weight = dx * (1.0f - dy); tx += 1; break;
            }
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
        if (k == 1) tx += 1;  // Adjust tx after second iteration
        if (k == 3) ty += 2;  // Adjust ty after fourth iteration
    }
}