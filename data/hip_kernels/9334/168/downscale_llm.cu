#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x = ii / (d2 * d3);
    int y = (ii / d3) % d2;
    int z = (ii % d3) / scale_factor;
    int w = (ii % d3) % scale_factor;
    int new_d2 = d2 * scale_factor;
    int new_d3 = d3 * scale_factor;
    return (((x * d1 + y) * new_d2 + off_y * d3) * new_d3) + (z * new_d3) + (w * scale_factor + off_x);
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x = ii / (d2 * d3);
    int y = (ii / d3) % d2;
    int z = (ii % d3) / scale_factor;
    int w = (ii % d3) % scale_factor;
    int new_d2 = d2 / scale_factor;
    int new_d3 = d3 / scale_factor;
    return (((x * d1 + y) * new_d2 + z) * new_d3) + w;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x + (threadIdx.y + blockDim.y * blockIdx.y) * blockDim.x * gridDim.x;
    if (ii >= no_elements) return;

    // Unroll the loops for potential performance improvement
    #pragma unroll
    for (int i = 0; i < scale_factor; i++) {
        #pragma unroll
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            gradInput_data[ii] += gradOutput_data[ipidx];
        }
    }
}