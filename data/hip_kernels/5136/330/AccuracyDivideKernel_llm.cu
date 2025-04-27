#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to perform division and prevent race conditions
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
    // Ensure all threads have updated data
    __syncthreads();
}