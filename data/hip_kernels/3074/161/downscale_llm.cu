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

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += (threadIdx.y + blockDim.y * blockIdx.y) * blockDim.x * gridDim.x;
    
    // Early exit for threads beyond elements count
    if (ii >= no_elements) return;
    
    // Use registers to avoid redundant calculations within loop
    const int base_idx = ii;
    const int sf_sq = scale_factor * scale_factor;

    for (int i = 0; i < sf_sq; i++){
        int off_x = i / scale_factor;
        int off_y = i % scale_factor;
        
        // Compute index in reduced grid
        int ipidx = translate_idx_inv(base_idx, d1, d2, d3, scale_factor, off_x, off_y);

        // Accumulate results
        gradInput_data[ii] += gradOutput_data[ipidx];
    }
}