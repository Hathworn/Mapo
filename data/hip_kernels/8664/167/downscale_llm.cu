#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    // Calculate index inverse with scaling and offset
    int x = ii / (d1 * d2 * d3);
    int y = (ii / (d2 * d3)) % d1;
    int z = (ii / d3) % d2;
    int w = ii % d3;
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    // Calculate index forward with scaling
    int x = ii / (d1 * d2 * d3);
    int y = (ii / (d2 * d3)) % d1;
    int z = (ii / d3) % d2;
    int w = ii % d3;
    w = w / scale_factor;
    z = z / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate unique thread index for 2D thread blocks
    long ii = threadIdx.x + blockDim.x * blockIdx.x +
              (threadIdx.y + blockDim.y * blockIdx.y) * blockDim.x * gridDim.x;
              
    // Return if index is out of bounds
    if (ii >= no_elements) return;

    // Use loop unrolling to reduce loop overhead
    for (int i = 0; i < scale_factor; ++i) {
        for (int j = 0; j < scale_factor; ++j) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            gradInput_data[ii] += gradOutput_data[ipidx];
        }
    }
}