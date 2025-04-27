#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sharedSum(int N, float *input, float *output) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Use shared memory for intra-block summation
    __shared__ float tmp[BLOCK_SIZE];
    
    // Initialize shared memory for the current thread
    tmp[threadIdx.x] = 0.0f;

    // Load data into register
    float a = input[i];

    // Combine atomic operation with thread synchronization
    atomicAdd(&tmp[threadIdx.x], a);
    __syncthreads();

    // Write the result from shared memory to output
    output[i] = tmp[threadIdx.x];
}