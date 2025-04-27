#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 1024

#ifndef THREADS
# define THREADS 1024
#endif

__global__ void total(float * input, float * output, unsigned int len) {
    __shared__ float sum[2 * BLOCK_SIZE];
    unsigned int i = threadIdx.x;
    unsigned int j = blockIdx.x * (blockDim.x * 2) + threadIdx.x;

    // Initialize the local sum with bounds check
    float localSum = 0.0f;
    if (j < len) localSum = input[j];
    if (j + blockDim.x < len) localSum += input[j + blockDim.x];

    // Store local sum into shared memory
    sum[i] = localSum;
    __syncthreads();

    // Efficient reduction in shared memory
    for (unsigned int step = blockDim.x / 2; step > 0; step >>= 1) {
        if (i < step) {
            sum[i] = localSum = localSum + sum[i + step];
        }
        __syncthreads();
    }

    // Store result of reduction
    if (i == 0) output[blockIdx.x] = sum[0];
}