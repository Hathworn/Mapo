#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Use 1D index for better memory coalescing and more uniform workload distribution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  
    int totalThreads = gridDim.x * blockDim.x;

    for (int idx_i = idx; idx_i < w * h; idx_i += totalThreads) {
        int j = idx_i % w;
        int i = idx_i / w;
        
        int flow_row_offset = i * flow_stride;
        int image_row_offset = i * image_stride;

        float u_ = u[flow_row_offset + j];
        float v_ = v[flow_row_offset + j];

        // Bottom left corner of target pixel
        float cx = u_ * time_scale + (float)j + 1.0f;
        float cy = v_ * time_scale + (float)i + 1.0f;
        // Pixel containing bottom left corner
        int tx = __float2int_rn(cx);
        int ty = __float2int_rn(cy);

        float value = src[image_row_offset + j];
        // Fill pixel
        if (!(tx >= w || tx < 0 || ty >= h || ty < 0)) {
            atomicAdd(dst + ty * image_stride + tx, value);  // Use atomicAdd outside of condition
        }
    }
}