#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for local storage to reduce global memory access
    __shared__ float local_accuracy;

    // Thread 0 initializes the shared memory variable
    if (threadIdx.x == 0) {
        local_accuracy = *accuracy;
    }

    // Sync threads to ensure shared memory is initialized
    __syncthreads();

    // Thread 0 performs the division and updates the global variable
    if (threadIdx.x == 0) {
        local_accuracy /= N;
        *accuracy = local_accuracy;
    }
}