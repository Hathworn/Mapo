#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Utilize shared memory for faster access
    extern __shared__ float sharedMemory[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory to minimize repeated global memory access
    if (i < N) {
        sharedMemory[threadIdx.x] = A[i];
        __syncthreads();
        C[i] = sharedMemory[threadIdx.x] + B[i];
    }
}