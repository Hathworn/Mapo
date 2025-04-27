#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use atomic operation for safe division in parallel execution
    extern __shared__ float temp[];
    int tid = threadIdx.x;
    
    if (tid == 0) {
        temp[0] = *accuracy;
    }
    
    __syncthreads();
    
    // Divide shared value by N
    if (tid == 0) {
        temp[0] /= N;
    }
    
    __syncthreads();
    
    // Store result back to global memory
    if (tid == 0) {
        *accuracy = temp[0];
    }
}