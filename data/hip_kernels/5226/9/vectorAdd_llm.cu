#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for loading data
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];

    if (i < numElements)
    {
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
        __syncthreads();  // Ensure all data is loaded before proceeding

        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}