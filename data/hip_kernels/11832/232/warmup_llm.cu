#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use shared memory for faster access
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];

    if (i < n) {
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
    }

    __syncthreads();  // Synchronize threads to ensure data is loaded

    if (k < n) C[k] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
}