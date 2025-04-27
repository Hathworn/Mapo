#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Use shared memory to optimize memory access
    extern __shared__ float sharedMem[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load data into shared memory
        sharedMem[threadIdx.x] = A[i];
        sharedMem[threadIdx.x + blockDim.x] = B[i];
        __syncthreads();

        // Perform the computation using shared memory
        C[i] = sharedMem[threadIdx.x] + sharedMem[threadIdx.x + blockDim.x];
    }
}