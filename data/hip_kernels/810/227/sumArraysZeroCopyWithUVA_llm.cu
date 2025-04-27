#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysZeroCopyWithUVA(float *A, float *B, float *C, const int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for improved memory access
    __shared__ float sA[256];
    __shared__ float sB[256];

    if (idx < N) {
        // Load data into shared memory
        sA[threadIdx.x] = A[idx];
        sB[threadIdx.x] = B[idx];

        // Make sure all threads have loaded their data
        __syncthreads();

        // Compute sum in shared memory
        C[idx] = sA[threadIdx.x] + sB[threadIdx.x];
    }
}