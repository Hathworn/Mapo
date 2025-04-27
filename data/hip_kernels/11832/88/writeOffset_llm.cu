#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure k is within bounds
    if (k < n) {
        // Use shared memory for better memory access patterns
        extern __shared__ float sharedA[];
        extern __shared__ float sharedB[];

        // Load data into shared memory
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
        __syncthreads();

        // Perform addition using shared memory
        C[k] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}