#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to compute the accuracy
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to perform the division to prevent race conditions
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
    // Optionally store and synchronize if necessary, to ensure the operation is done correctly
    __syncthreads();
}