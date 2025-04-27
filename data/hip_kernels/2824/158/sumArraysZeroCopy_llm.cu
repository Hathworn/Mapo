#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumArraysZeroCopy(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better memory throughput
    __shared__ float shared_A[256];
    __shared__ float shared_B[256];

    if (i < N) {
        // Load data into shared memory
        shared_A[threadIdx.x] = A[i];
        shared_B[threadIdx.x] = B[i];

        __syncthreads();

        // Compute using shared memory
        C[i] = shared_A[threadIdx.x] + shared_B[threadIdx.x];
    }
}