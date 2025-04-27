#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use shared memory for better performance
    __shared__ float sharedAcc;

    // Only one thread needs to do the division
    if (threadIdx.x == 0) {
        sharedAcc = *accuracy / N;
    }
    __syncthreads();

    // Ensure the result is written back to global memory
    if (threadIdx.x == 0) {
        *accuracy = sharedAcc;
    }
}