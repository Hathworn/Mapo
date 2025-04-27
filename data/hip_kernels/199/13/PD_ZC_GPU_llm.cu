```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PD_ZC_GPU(float *d_input, float *d_output, int maxTaps, int nTimesamples, int nLoops) {
    int x_r, y_r, x_w, y_w;
    int Elements_per_block = PD_NTHREADS * PD_NWINDOWS;

    // Calculate read and write indices
    y_r = (blockIdx.y * blockDim.y + threadIdx.y) * nTimesamples;
    x_r = (blockIdx.x + 1) * Elements_per_block + threadIdx.x;

    y_w = (blockIdx.y * blockDim.y + threadIdx.y) * (maxTaps - 1) * gridDim.x;
    x_w = blockIdx.x * (maxTaps - 1) + threadIdx.x;

    // Added shared memory for optimized memory access
    __shared__ float sharedMem[PD_NTHREADS];

    // Optimize loop to access data in shared memory
    for (int f = 0; f < nLoops; f++) {
        if (x_r < nTimesamples && threadIdx.x < (maxTaps - 1)) {
            sharedMem[threadIdx.x] = d_input[x_r + y_r + f * WARP];  // Load to shared memory
            __syncthreads();  // Synchronize threads within block
            d_output[x_w + y_w + f * WARP] = sharedMem[threadIdx.x]; // Write from shared memory
        }
    }
}