#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x and threadIdx.x to access the first element only if they are (0,0).
    // This avoids unnecessary global memory accesses and ensures only one thread modifies *accuracy.
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}