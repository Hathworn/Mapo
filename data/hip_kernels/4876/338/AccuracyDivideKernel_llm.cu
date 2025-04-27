#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for better performance if N is large
    __shared__ float shared_accuracy;
    
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();
    
    if (threadIdx.x == 0) {
        // Perform the division on one thread for global memory updating
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}