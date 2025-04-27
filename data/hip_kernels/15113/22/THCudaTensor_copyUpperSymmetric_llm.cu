#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Use shared memory to hold a block of input data
    extern __shared__ float sharedInput[];

    // Calculate the index and load the block into shared memory
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    const int totalThreads = gridDim.x * blockDim.x;
    
    for (; idx < len; idx += totalThreads) {
        const int r = idx % n;
        const int c = idx / n;

        // Load input data into shared memory to reduce global memory access
        sharedInput[threadIdx.x] = input[idx];
        __syncthreads();

        if (r > c) {
            input[idx] = sharedInput[r * n + c];
        }
        __syncthreads();
    }
}