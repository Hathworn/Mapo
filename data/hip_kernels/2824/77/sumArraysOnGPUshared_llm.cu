#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPUshared(float *A, float *B, float *C, const int N)
{
    __shared__ float smem[512];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared memory to zero
    if (threadIdx.x < 512) {
        smem[threadIdx.x] = 0.0f;
    }
    __syncthreads();

    if (i < N) {
        // Accumulate value into shared memory
        atomicAdd(&smem[threadIdx.x], i);
        __syncthreads();

        // Compute result using shared memory
        C[i] = A[i] + B[i] + smem[threadIdx.x];
    }
}