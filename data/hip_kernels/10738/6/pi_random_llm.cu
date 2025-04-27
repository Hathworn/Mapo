#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pi_random(float* x, float* y, int* global_count) {
    __shared__ int counts[nthreads];

    int globalId = blockIdx.x * blockDim.x + nitemsperthread * threadIdx.x;

    int thread_count=0;
    for (int i=0; i<nitemsperthread; i++) {
        // Check boundary condition first to minimize wasted operations
        if (globalId+i < nsamples) {
            float x_val = x[globalId+i];
            float y_val = y[globalId+i];
            // Avoid repeated arithmetic operations
            if (x_val * x_val + y_val * y_val < 1.0f) {
                thread_count++;
            }
        }
    }

    counts[threadIdx.x] = thread_count;
    __syncthreads();

    if (threadIdx.x == 0) {
        int block_count = 0;
        // Accumulate results using a single thread after synchronization
        for (int i=0; i<nthreads; i++) {
            block_count += counts[i];
        }
        global_count[blockIdx.x] = block_count;
    }
}