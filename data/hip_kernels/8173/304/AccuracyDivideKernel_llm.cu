#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Load accuracy using a shared memory to reduce global memory access cost
    __shared__ float shared_accuracy;
    
    if (threadIdx.x == 0) {
        // Only one thread performs the division and writes back to global memory
        shared_accuracy = *accuracy / N;
    }
    __syncthreads();

    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}