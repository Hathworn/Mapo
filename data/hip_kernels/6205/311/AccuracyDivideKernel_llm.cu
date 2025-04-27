#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to minimize global memory access within the kernel
    __shared__ float shared_accuracy;
    
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();

    // Each thread updates a copy of the accuracy
    float local_accuracy = shared_accuracy / N;
    
    if (threadIdx.x == 0) {
        // Only one thread writes back to global memory
        *accuracy = local_accuracy;
    }
}