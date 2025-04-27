#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to update shared memory for consistent results
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}