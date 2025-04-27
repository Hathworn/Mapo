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

__global__ void downscale(float *gradInput_data, float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate global thread index
    long ii = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * (blockDim.x * gridDim.x);
    if (ii >= no_elements) return;
    
    // Pre-compute indices for the loop to reduce redundant computation
    int base_ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0);
    int stride_d3 = d3 * scale_factor;

    // Unroll the loop for better efficiency
    for (int i = 0; i < scale_factor; i++) {
        int ipidx = base_ipidx + i * stride_d3;
        for (int j = 0; j < scale_factor; j++) {
            gradInput_data[ii] += gradOutput_data[ipidx + j];
        }
    }
}