#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a shared memory location to perform division only once
    __shared__ float shared_accuracy;
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy / N;
    }
    __syncthreads();
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}