#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for faster access
    __shared__ float shared_accuracy;
    
    // Only one thread performs the division
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy / N;
    }
    
    // Synchronize threads to ensure the shared value is updated
    __syncthreads();

    // All threads write back the updated shared value
    *accuracy = shared_accuracy;
}