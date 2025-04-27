#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readWriteOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;
    
    // Use shared memory for faster access
    __shared__ float sharedA[1024];
    __shared__ float sharedB[1024];

    // Preload data to shared memory if within bounds
    if (k < n) {
        sharedA[threadIdx.x] = A[k];
        sharedB[threadIdx.x] = B[k];
    }
    if (k + blockDim.x < n) {
        sharedA[threadIdx.x + blockDim.x] = A[k + blockDim.x];
        sharedB[threadIdx.x + blockDim.x] = B[k + blockDim.x];
    }
    if (k + 2 * blockDim.x < n) {
        sharedA[threadIdx.x + 2 * blockDim.x] = A[k + 2 * blockDim.x];
        sharedB[threadIdx.x + 2 * blockDim.x] = B[k + 2 * blockDim.x];
    }
    if (k + 3 * blockDim.x < n) {
        sharedA[threadIdx.x + 3 * blockDim.x] = A[k + 3 * blockDim.x];
        sharedB[threadIdx.x + 3 * blockDim.x] = B[k + 3 * blockDim.x];
    }

    // Synchronize threads after loading to shared memory
    __syncthreads();

    // Conditional memory operations
    if (k + 3 * blockDim.x < n) {
        C[k]                  = sharedA[threadIdx.x]                  + sharedB[threadIdx.x];
        C[k + blockDim.x]     = sharedA[threadIdx.x + blockDim.x]     + sharedB[threadIdx.x + blockDim.x];
        C[k + 2 * blockDim.x] = sharedA[threadIdx.x + 2 * blockDim.x] + sharedB[threadIdx.x + 2 * blockDim.x];
        C[k + 3 * blockDim.x] = sharedA[threadIdx.x + 3 * blockDim.x] + sharedB[threadIdx.x + 3 * blockDim.x];
    }
}