#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst)
{
    // Calculate global linear index for the thread
    int globalIndex = blockIdx.y * blockDim.y * w + blockIdx.x * blockDim.x + threadIdx.y * w + threadIdx.x;
    
    // Calculate flow and image row offsets
    int flow_row_offset = (globalIndex / w) * flow_stride;
    int image_row_offset = (globalIndex / w) * image_stride;
    
    // Check bounds and load data efficiently
    if (globalIndex < w * h) {
        float u_ = u[flow_row_offset + (globalIndex % w)];
        float v_ = v[flow_row_offset + (globalIndex % w)];

        // Bottom left corner of target pixel
        float cx = u_ * time_scale + (float)(globalIndex % w) + 1.0f;
        float cy = v_ * time_scale + (float)(globalIndex / w) + 1.0f;

        // Pixel containing bottom left corner
        int tx = __float2int_rn(cx);
        int ty = __float2int_rn(cy);

        float value = src[image_row_offset + (globalIndex % w)];
        
        // Fill pixel within bounds efficiently
        if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
            atomicAdd(dst + ty * image_stride + tx, value);
        }
    }
}