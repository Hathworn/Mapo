#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddTo32(int *sum, int *out, const int *pIn)
{
    // Use shared memory to reduce global memory transactions
    __shared__ int sharedIn;
    
    // Load input into shared memory once per block
    if (threadIdx.x == 0)
    {
        sharedIn = *pIn;
    }
    __syncthreads(); // Ensure sharedIn is loaded before use

    // Perform atomic add using shared memory value
    atomicAdd(&out[threadIdx.x], sharedIn);
}