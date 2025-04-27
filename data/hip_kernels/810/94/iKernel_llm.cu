```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to reduce global memory access latency
    __shared__ float sharedA[256];  // Adjust size as per blockDim.x if different
    __shared__ float sharedB[256];

    if (i < N) {
        sharedA[threadIdx.x] = A[i];
        sharedB[threadIdx.x] = B[i];
        
        __syncthreads();  // Ensure all data is loaded before proceeding
        
        C[i] = sharedA[threadIdx.x] + sharedB[threadIdx.x];
    }
}