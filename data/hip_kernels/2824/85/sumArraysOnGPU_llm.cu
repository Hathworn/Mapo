#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Use shared memory to enhance performance
    extern __shared__ float sharedMemory[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load inputs into shared memory
    if (idx < N) {
        sharedMemory[tid] = A[idx] * B[idx];
    }
    __syncthreads();

    // Perform operations in shared memory
    if (idx < N) {
        C[idx] = sharedMemory[tid];
    }
}