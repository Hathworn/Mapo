#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C)
{
    // Optimization: Use shared memory to store block data
    extern __shared__ float sharedA[], sharedB[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load data into shared memory
    sharedA[tid] = A[i];
    sharedB[tid] = B[i];
    __syncthreads();

    // Perform computation using shared memory
    C[i] = sharedA[tid] + sharedB[tid];
}