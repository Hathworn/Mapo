#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to reduce global memory access
    __shared__ float shared_accuracy;
    
    // Load the data into shared memory
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }

    // Ensure all threads wait until shared memory is loaded
    __syncthreads();

    // Perform the division in only one thread
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
        *accuracy = shared_accuracy;
    }
}