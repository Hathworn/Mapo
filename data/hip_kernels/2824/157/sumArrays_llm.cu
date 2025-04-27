#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrays(float *A, float *B, float *C, const int N)
{
    // Use shared memory for performance improvement
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load elements into shared memory
    if (i < N) {
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
        __syncthreads(); // Synchronize threads within a block

        // Perform computation using shared memory
        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}