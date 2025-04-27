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

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = blockIdx.y * (blockDim.y * gridDim.x) * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x + threadIdx.y * blockDim.x;  // Optimize block and thread index calculation
    if (ii >= no_elements) return;
    int scale_factor_sq = scale_factor * scale_factor;  // Precompute scale factor squared
    int base_ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0); // Base index computation
    for (int off = 0; off < scale_factor_sq; off++) {
        int i = off / scale_factor;  // Precompute x offset
        int j = off % scale_factor;  // Precompute y offset
        int ipidx = base_ipidx + translate_idx_inv(0, 1, d2, d3, scale_factor, i, j);  // Reuse base_ipidx and increment with offsets
        gradInput_data[ii] += gradOutput_data[ipidx];
    }
}