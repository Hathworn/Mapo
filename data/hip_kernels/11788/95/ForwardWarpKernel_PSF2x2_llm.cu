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

    // bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Unroll modff computation
    float px = floorf(cx), py = floorf(cy);
    float dx = cx - px, dy = cy - py;

    // Use single load for value
    float value = src[image_row_offset + j];
    float weight;
    
    const int coordinates[4][2] = {
        {0, 0}, // bottom right
        {-1, 0}, // bottom left
        {-1, -1}, // upper left
        {0, -1}  // upper right
    };
    
    const float weights[4] = {
        dx * dy,
        (1.0f - dx) * dy,
        (1.0f - dx) * (1.0f - dy),
        dx * (1.0f - dy)
    };

    // Combine operations into a single block
    for (int idx = 0; idx < 4; ++idx)
    {
        int tx = (int)px + coordinates[idx][0];
        int ty = (int)py + coordinates[idx][1];
        if (!(tx >= w || tx < 0 || ty >= h || ty < 0))
        {
            weight = weights[idx];
            _atomicAdd(dst + ty * image_stride + tx, value * weight);
            _atomicAdd(normalization_factor + ty * image_stride + tx, weight);
        }
    }
}