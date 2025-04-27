#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Reduce memory access conflicts by using shared memory
    __shared__ float shared_accuracy;
    
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();

    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}