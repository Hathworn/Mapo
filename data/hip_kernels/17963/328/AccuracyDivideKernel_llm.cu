#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory to reduce global memory access
    __shared__ float shared_accuracy;

    // Initialize shared memory from global memory
    if (threadIdx.x == 0) {
        shared_accuracy = *accuracy;
    }
    __syncthreads();

    // Divide accuracy in shared memory
    if (threadIdx.x == 0) {
        shared_accuracy /= N;
    }
    __syncthreads();

    // Write result back to global memory
    if (threadIdx.x == 0) {
        *accuracy = shared_accuracy;
    }
}