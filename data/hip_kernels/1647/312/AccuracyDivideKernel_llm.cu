#include "hip/hip_runtime.h"
#include "includes.h"

// Use thread index to perform operation on N elements if necessary.
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    if (threadIdx.x == 0) {
        // Only thread 0 performs the division to minimize overhead.
        *accuracy /= N;
    }
}