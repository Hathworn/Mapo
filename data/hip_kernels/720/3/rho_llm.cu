#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void rho(float *x, int size, float lambda)
{
    // Calculate the global thread index.
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread index is within the array boundary.
    if (id < size) {
        // Perform computation using shared memory.
        __shared__ float cached_lambda;
        if (threadIdx.x == 0) {
            cached_lambda = lambda;
        }
        __syncthreads(); // Ensure all threads have updated shared memory.

        // Optimize computation with shared data.
        x[id] = 1 - expf(-x[id] / cached_lambda);
    }
}