#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for cooperative access
    __shared__ float shared_accuracy;
    
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();
    
    // Each thread divides the shared accuracy once
    shared_accuracy /= N;
    
    __syncthreads();
    
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}