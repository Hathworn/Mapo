#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Calculate unique global thread index
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // The operation below is a no-op, remove as it doesn't serve any function.
    // ind = ind + 1;

    // To effectively "warm-up," ensure all threads are active by executing a dummy operation
    if (ind >= 0) {
        __syncthreads();  // Synchronize to ensure all threads have reached this point
    }
}