#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to buffer the `accuracy` value to avoid accessing global memory frequently
    __shared__ float shared_accuracy;

    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;  // Load into shared memory by one thread
    }
    __syncthreads();

    if (threadIdx.x == 0) {
        shared_accuracy /= N;  // Perform division in shared memory
        *accuracy = shared_accuracy;  // Write back the result by one thread
    }
}