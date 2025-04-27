#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to minimize global memory access
    __shared__ float shared_accuracy;
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();

    // Perform division in parallel
    if (threadIdx.x < N) {
        shared_accuracy /= N;
    }
    __syncthreads();
    
    // Write back the result to global memory from thread 0
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}