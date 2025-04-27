#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use a single printf per block for optimized performance
    __shared__ char msg[256];
    int tid = threadIdx.x;
    
    if (tid == 0) {
        printf("Hello world! This is block %d\n", blockIdx.x);
    }
    __syncthreads(); // Ensure all threads reach this point before proceeding
}