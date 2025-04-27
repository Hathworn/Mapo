#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to reduce global memory accesses
    __shared__ float shared_accuracy;

    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    
    __syncthreads();
    
    // Perform division in shared memory; ensures only one division operation
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}