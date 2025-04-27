#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimizedKernel(int N, float *input, float *output) {
    // Use shared memory for better memory access efficiency
    extern __shared__ float sharedData[];
    int tid = threadIdx.x;
    int blockSize = blockDim.x;

    // Initialize shared memory
    float localSum = 0.0f;
    for (int i = tid; i < N; i += blockSize) {
        localSum += input[i];
    }
    sharedData[tid] = localSum;
    __syncthreads();

    // Parallel reduction to compute the sum using shared memory
    for (int stride = blockSize / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            sharedData[tid] += sharedData[tid + stride];
        }
        __syncthreads();
    }

    // Normalize the result and store in output
    if (tid == 0) {
        *output = sharedData[0] / N;
    }
}