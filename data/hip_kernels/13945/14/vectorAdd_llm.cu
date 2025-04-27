#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Using shared memory for faster access
    extern __shared__ float sharedA[];
    extern __shared__ float sharedB[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Loading data into shared memory
    if (i < numElements)
    {
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
    }

    __syncthreads();

    // Calculating result
    if (i < numElements)
    {
        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}