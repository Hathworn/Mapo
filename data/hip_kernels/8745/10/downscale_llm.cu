#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized device function to compute the inverse translation index
__device__ __forceinline__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int w = ii % d3;
    ii /= d3;
    int z = ii % d2;
    ii /= d2;
    int y = ii % d1;
    ii /= d1;
    int x = ii;
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

// Optimized device function to compute the translation index
__device__ __forceinline__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int w = ii % d3;
    ii /= d3;
    int z = ii % d2;
    ii /= d2;
    int y = ii % d1;
    ii /= d1;
    int x = ii;
    w /= scale_factor;
    z /= scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;

    // Unroll the loops for performance improvement
#pragma unroll
    for (int i = 0; i < scale_factor; i++) {
#pragma unroll
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            gradInput_data[ii] += gradOutput_data[ipidx];
        }
    }
}