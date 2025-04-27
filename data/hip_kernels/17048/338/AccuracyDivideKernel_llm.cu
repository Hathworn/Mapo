#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using shared memory for synchronization
    __shared__ float shared_accuracy;

    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();

    // Only one thread divides and writes back to global memory
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}