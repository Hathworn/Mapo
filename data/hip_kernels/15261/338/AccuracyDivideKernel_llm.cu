#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using thread 0 to perform division to avoid race conditions
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
    // Ensure all threads sync before exiting the kernel
    __syncthreads();
}