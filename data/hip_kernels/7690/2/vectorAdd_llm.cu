#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float * __restrict__ A, const float * __restrict__ B, float * __restrict__ C, int numElements)
{
    // Calculate the global index for each thread
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use a single conditional branch to avoid divergent execution
    if (i < numElements)
    {
        // Compute the vector addition
        C[i] = A[i] + B[i];
    }
}