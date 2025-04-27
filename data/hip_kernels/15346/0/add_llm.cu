#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    // Using shared memory for optimization
    __shared__ int sharedA, sharedB;
    
    if (threadIdx.x == 0) {
        sharedA = *a;
        sharedB = *b;
    }
    __syncthreads();
    
    if (threadIdx.x == 0) {
        *c = sharedA + sharedB;
    }
}