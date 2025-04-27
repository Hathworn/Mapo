#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(float *A, float *B, float *C, const int N)
{
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sharedMem[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;
    
    if (i < N) {
        // Load data into shared memory
        sharedMem[tid] = A[i];
        __syncthreads();
        
        // Perform computation using shared memory
        C[i] = sharedMem[tid] + B[i];
    }
}