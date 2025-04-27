#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;
    
    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Compute corner position with time scaling
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;
    
    // Convert to integer coordinates
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Optimize memory access by precalculating value index
    if (!(tx >= w || tx < 0 || ty >= h || ty < 0)) {
        int dst_index = ty * image_stride + tx;
        float value = src[image_row_offset + j];
        // Use atomic operation to handle concurrent writes
        atomicAdd(dst + dst_index, value);
    }
}