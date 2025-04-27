#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swapVals_kernel(unsigned int * d_newArray, unsigned int * d_oldArray, unsigned int numElems)
{
    unsigned int gIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Using shared memory to reduce global memory access
    __shared__ unsigned int shared_oldArray[256]; // Assuming blockDim.x <= 256

    if (gIdx < numElems)
    {
        // Load data into shared memory
        shared_oldArray[threadIdx.x] = d_oldArray[gIdx];
        __syncthreads();

        // Store data from shared memory to global memory
        d_newArray[gIdx] = shared_oldArray[threadIdx.x];
    }
}