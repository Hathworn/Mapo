#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Use shared memory if possible for increased performance on larger datasets
    extern __shared__ float sharedMemory[];
    float *sharedA = &sharedMemory[0];
    float *sharedB = &sharedMemory[blockDim.x];

    if (i < n) {
        // Load data into shared memory
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
    }
    __syncthreads();

    if (k < n) {
        // Perform the operation from shared memory to optimize memory access
        C[k] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}