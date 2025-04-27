#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread index to prevent thread divergence and make sure only one thread performs the operation
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}