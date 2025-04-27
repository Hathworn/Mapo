#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for better performance
    __shared__ float sharedAccuracy;

    // Load data into shared memory
    if (threadIdx.x == 0) {
        sharedAccuracy = *accuracy;
    }
    __syncthreads();

    // Perform division in shared memory
    if (threadIdx.x == 0) {
        sharedAccuracy /= N;
        *accuracy = sharedAccuracy; // Store result back to global memory
    }
}