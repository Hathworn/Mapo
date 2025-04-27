#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for better performance
    __shared__ float shared_accuracy;
    
    // Load data into shared memory
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();
    
    // Perform division and store result back
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}