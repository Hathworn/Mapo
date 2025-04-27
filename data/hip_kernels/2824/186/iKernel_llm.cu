#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ float sA[256];
    __shared__ float sB[256];

    if (i < N)
    {
        // Load data into shared memory
        sA[threadIdx.x] = A[i];
        sB[threadIdx.x] = B[i];
        __syncthreads();

        // Perform computation using shared memory
        C[i] = sA[threadIdx.x] + sB[threadIdx.x];
    }
}