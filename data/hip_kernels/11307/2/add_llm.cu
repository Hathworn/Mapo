#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c)
{
    // Use shared memory to reduce global memory access latency
    __shared__ int temp;
    
    if (threadIdx.x == 0) {
        temp = a + b; // Compute the sum using a single thread
    }
    
    __syncthreads();
    
    if (threadIdx.x == 0) {
        *c = temp; // Store the result in the global memory
    }
}