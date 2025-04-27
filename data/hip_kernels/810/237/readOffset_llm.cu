#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;
    
    // Using shared memory to minimize redundant global memory accesses
    __shared__ float sharedA[256]; // Assumption: blockDim.x <= 256
    __shared__ float sharedB[256]; // Assumption: blockDim.x <= 256

    if (k < n) {
        sharedA[threadIdx.x] = A[k];
        sharedB[threadIdx.x] = B[k];
        __syncthreads(); // Ensure all threads have finished copying to shared memory

        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}