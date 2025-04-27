#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst) {
    int j = threadIdx.x + blockIdx.x * blockDim.x;
    int i = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check bounds early to avoid unnecessary computations
    if (i >= h || j >= w) return;

    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Bottom left corner of target pixel
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;

    // Pixel containing bottom left corner
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Use a shared memory buffer to reduce global memory accesses (hypothetical improvement)
    // __shared__ float shared_data[BLOCK_SIZE]; // Assume BLOCK_SIZE is defined appropriately

    float value = src[image_row_offset + j];
    // Fill pixel
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}