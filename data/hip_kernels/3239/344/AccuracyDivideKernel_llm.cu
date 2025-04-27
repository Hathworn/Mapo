#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Check if the index is zero for a single-threaded operation
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}