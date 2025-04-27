#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffsetUnroll2(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    unsigned int k = i + offset;

    // Use a local shared memory block for coalesced memory access
    extern __shared__ float sharedMem[];
    float *sharedA = sharedMem;
    float *sharedB = sharedA + blockDim.x * 2;

    if (k + blockDim.x < n)
    {
        // Load data into shared memory
        sharedA[threadIdx.x] = A[k];
        sharedB[threadIdx.x] = B[k];
        sharedA[threadIdx.x + blockDim.x] = A[k + blockDim.x];
        sharedB[threadIdx.x + blockDim.x] = B[k + blockDim.x];
        __syncthreads();

        // Compute using shared memory
        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
        C[i + blockDim.x] = sharedA[threadIdx.x + blockDim.x] + sharedB[threadIdx.x + blockDim.x];
    }
}