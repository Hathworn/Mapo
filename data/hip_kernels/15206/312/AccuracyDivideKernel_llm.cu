#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for efficiency
    __shared__ float sharedAccuracy;

    // Load accuracy into shared memory
    if (threadIdx.x == 0) {
        sharedAccuracy = *accuracy;
    }
    __syncthreads();

    // Divide in shared memory
    if (threadIdx.x == 0) {
        sharedAccuracy /= N;
    }
    __syncthreads();

    // Write back to global memory
    if (threadIdx.x == 0) {
        *accuracy = sharedAccuracy;
    }
}