#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int n)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for faster access
    __shared__ float sA[256];
    __shared__ float sB[256];

    // Load data into shared memory
    if (i < n) {
        sA[threadIdx.x] = A[i];
        sB[threadIdx.x] = B[i];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (i < n)
    {
        C[i] = sA[threadIdx.x] + sB[threadIdx.x];
    }
}