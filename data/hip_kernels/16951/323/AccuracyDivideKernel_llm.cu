#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to reduce global memory access latency
    __shared__ float shared_accuracy;
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();
    
    // Divide once per block, then write back to global memory
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}