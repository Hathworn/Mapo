#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x = ii / (d2 * d3);
    int y = (ii / d3) % d2;
    int z = ii % d3;
    y = y * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    return ((x * d1 + y) * d2 + z);
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x = ii / (d2 * d3);
    int y = (ii / d3) % d2;
    int z = ii % d3;
    y /= scale_factor;
    z /= scale_factor;
    d2 /= scale_factor;
    return ((x * d1 + y) * d2 + z);
}

__global__ void downscale(float* gradInput_data, float* gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate output offset
    long ii = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.y * gridDim.x * blockDim.y + threadIdx.y * gridDim.x * blockDim.x;
    if (ii >= no_elements) return; // Early return for bounds check
    
    // Loop unrolling optimization
    #pragma unroll
    for (int i = 0; i < scale_factor; i++) {
        #pragma unroll
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            gradInput_data[ii] += gradOutput_data[ipidx];
        }
    }
}