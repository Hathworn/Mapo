#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread block reduction to improve performance
    __shared__ float partialSum;
    if (threadIdx.x == 0) {
        partialSum = 0.0f;
    }
    __syncthreads();

    // Each thread computes a part of accuracy sum
    atomicAdd(&partialSum, accuracy[threadIdx.x]);

    __syncthreads();

    // Only one thread divides the result
    if (threadIdx.x == 0) {
        *accuracy = partialSum / N;
    }
}