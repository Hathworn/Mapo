#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimize by using shared memory to reduce global memory access
    extern __shared__ float shared_accuracy[];
    if (threadIdx.x == 0) {
        shared_accuracy[0] = *accuracy;
    }
    __syncthreads();
    
    // Single thread update to avoid race condition
    if (threadIdx.x == 0) {
        shared_accuracy[0] /= N;
        *accuracy = shared_accuracy[0];
    }
}