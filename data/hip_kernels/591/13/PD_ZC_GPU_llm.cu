#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PD_ZC_GPU(float *d_input, float *d_output, int maxTaps, int nTimesamples, int nLoops) {
    int x_r, y_r, x_w, y_w;
    int Elements_per_block = PD_NTHREADS * PD_NWINDOWS;
    
    // Precompute commonly used values outside the loop
    y_r = (blockIdx.y * blockDim.y + threadIdx.y) * nTimesamples;
    x_r = (blockIdx.x + 1) * Elements_per_block + threadIdx.x;
    y_w = (blockIdx.y * blockDim.y + threadIdx.y) * (maxTaps - 1) * gridDim.x;
    x_w_init = blockIdx.x * (maxTaps - 1) + threadIdx.x; // Initialize writing offset

    // Unroll loop for better performance if iterations are small
    #pragma unroll
    for (int f = 0; f < nLoops; f++) {
        if (x_r < nTimesamples && threadIdx.x < (maxTaps - 1)) {
            // Compute write index
            int x_w = x_w_init + f * WARP;
            // Perform memory sharing efficiently
            d_output[x_w + y_w] = d_input[x_r + y_r + f * WARP];
        }
    }
}