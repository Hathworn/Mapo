#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *dest, int a, int b)
{
    // Use shared memory to store the sum temporarily
    __shared__ int temp_sum;
    
    // Each thread in the block calculates the sum
    // Assuming only one thread is used; no reduction is needed
    if (threadIdx.x == 0) {
        temp_sum = a + b;
    }

    // Use __syncthreads() to ensure all threads have computed before copying to global memory
    __syncthreads();

    // Copy from shared to global memory
    if (threadIdx.x == 0) {
        *dest = temp_sum;
    }
}