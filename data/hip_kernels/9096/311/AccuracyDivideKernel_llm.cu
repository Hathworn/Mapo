#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Ensure shared memory utilization to optimize division across threads
    __shared__ float shared_accuracy;

    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }

    __syncthreads();

    // Each thread calculates part of the division
    shared_accuracy /= N;

    __syncthreads();

    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}