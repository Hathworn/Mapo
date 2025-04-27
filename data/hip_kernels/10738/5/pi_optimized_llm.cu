#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pi_optimized(float* x, float* y, int* global_count) {
    __shared__ int counts[nthreads];

    // Calculate global index
    int globalId = blockIdx.x * blockDim.x + threadIdx.x;

    int thread_count = 0;
    for (int i = 0; i < nitemsperthread; i++) {
        int idx = globalId + (i * nthreads * nblocks);
        if (idx < nsamples) {
            // Optimized condition checking for circle inclusion
            if (x[idx] * x[idx] + y[idx] * y[idx] < 1.0f) {
                thread_count++;
            }
        }
    }

    // Store thread count in shared memory
    counts[threadIdx.x] = thread_count;
    __syncthreads();

    // Accumulate counts only once per block
    if (threadIdx.x == 0) {
        int block_count = 0;
        for (int i = 0; i < nthreads; i++) {
            block_count += counts[i];
        }
        // Store block count in global memory
        global_count[blockIdx.x] = block_count;
    }
}