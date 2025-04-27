#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel for accuracy division
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for reduced global memory access
    __shared__ float shared_accuracy;
    
    // Load shared memory from global
    shared_accuracy = *accuracy;
    __syncthreads(); // Ensure all threads have loaded

    // Perform division and write back to global memory
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
    __syncthreads(); // Synchronize before completion
}