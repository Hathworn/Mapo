#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
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
    ii = ii / d3;
    z = ii % d2;
    ii = ii / d2;
    y = ii % d1;
    ii = ii / d1;
    x = ii;
    w = w / scale_factor;
    z = z / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate global thread index with improved readability
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += (threadIdx.y + blockDim.y * blockIdx.y) * blockDim.x * gridDim.x;
    
    // Early exit for threads out of range
    if (ii >= no_elements) return;
    
    // Efficient iteration using pre-computed scale limit
    const int scale_limit = scale_factor * scale_factor;
    
    // Precompute the base index for gradOutput_data to avoid redundant calculations
    int base_idx = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0);
    
    // Accumulate results from gradOutput_data to gradInput_data
    for (int s = 0; s < scale_limit; s++) {
        int i = s / scale_factor;
        int j = s % scale_factor;
        int ipidx = base_idx + i * d3 * scale_factor + j;  // Compute ipidx efficiently
        gradInput_data[ii] += gradOutput_data[ipidx];
    }
}