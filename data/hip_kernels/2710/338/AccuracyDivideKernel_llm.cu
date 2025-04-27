#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to reduce kernel launch overhead
    __shared__ float shared_accuracy;
    
    // Only one thread in the block performs the division
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy / N;
    }
    
    // Ensure all threads have the updated value
    __syncthreads();
    
    // Copy the result back to global memory (only needed once)
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}