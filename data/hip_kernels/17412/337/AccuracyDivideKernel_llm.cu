#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to reduce global memory access
    __shared__ float shared_accuracy;

    // Only one thread does the division
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy / N;
    }

    // Synchronize to ensure shared memory is written before any thread proceeds
    __syncthreads();

    // All threads update the global memory with the result
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}