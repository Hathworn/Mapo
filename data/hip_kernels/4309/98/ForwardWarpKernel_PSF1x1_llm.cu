#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void ForwardWarpKernel_PSF1x1(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *dst) {
    // Calculate global indices
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    // Return if the indices are out of bounds
    if (i >= h || j >= w) return;

    // Calculate offsets
    int flow_row_offset = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Read flow values
    float u_ = u[flow_row_offset + j];
    float v_ = v[flow_row_offset + j];

    // Compute target pixel's bottom left corner
    float cx = u_ * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v_ * time_scale + static_cast<float>(i) + 1.0f;

    // Determine the target pixel integer position
    int tx = __float2int_rn(cx);
    int ty = __float2int_rn(cy);

    // Read source value
    float value = src[image_row_offset + j];

    // Check boundaries and perform atomic add
    if (!(tx >= w || tx < 0 || ty >= h || ty < 0)) {
        atomicAdd(dst + ty * image_stride + tx, value);
    }
}
```
