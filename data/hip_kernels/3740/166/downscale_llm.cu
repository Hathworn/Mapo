#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3;
    ii /= d3;
    z = ii % d2;
    ii /= d2;
    y = ii % d1;
    ii /= d1;
    x = ii;
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x, y, z, w;
    w = ii % d3;
    ii /= d3;
    z = ii % d2;
    ii /= d2;
    y = ii % d1;
    ii /= d1;
    x = ii;
    w /= scale_factor;
    z /= scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    
    // Launch bounds check to ensure thread operates only within valid range
    if (ii >= no_elements) return;

    // Cache scale_factor^2 for use within inner loop
    int scale_squared = scale_factor * scale_factor;

    // Restructure loop for improved performance using pointer arithmetic
    float *gradInput_ptr = &gradInput_data[ii];
    for (int i = 0; i < scale_squared; i++) {
        int off_x = i % scale_factor;
        int off_y = i / scale_factor;
        int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, off_x, off_y);
        *gradInput_ptr += gradOutput_data[ipidx];
    }
}