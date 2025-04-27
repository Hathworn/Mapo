#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for synchronization among threads
    __shared__ float shared_accuracy;
    
    if (threadIdx.x == 0) {
        // Only one thread does the division to avoid race conditions
        shared_accuracy = *accuracy / N;
    }
    __syncthreads(); // Synchronize threads to ensure shared memory update

    if (threadIdx.x == 0) {
        // Only one thread updates the global memory
        *accuracy = shared_accuracy;
    }
}