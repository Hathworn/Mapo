#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for intermediate storage and atomic operation for safer updates
__global__ void add2(int a, int b, int *sum)
{
    __shared__ int temp; // Declare shared memory for intermediate sum
    if (threadIdx.x == 0) {
        temp = 0;
    }
    __syncthreads();

    // Only one thread needs to do the addition and update
    if (threadIdx.x == 0) {
        temp = a + b;
        atomicAdd(sum, temp); // Atomic operation to ensure correct update
    }
}