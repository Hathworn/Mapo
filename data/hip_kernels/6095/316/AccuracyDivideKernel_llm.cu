#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy to shared memory for faster access
    __shared__ float shared_accuracy;
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();

    // Perform division using shared memory
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy / N;
    }
}