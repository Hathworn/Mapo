#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for better performance using shared memory
__global__ void simpleMPIKernel(float *input, float *output) {
    extern __shared__ float sharedInput[];
    
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int localTid = threadIdx.x;

    // Load input into shared memory
    sharedInput[localTid] = input[tid];
    __syncthreads();

    // Perform computation using shared memory
    output[tid] = sqrt(sharedInput[localTid]);
}