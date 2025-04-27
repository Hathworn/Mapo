#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread 0 to perform the division for less thread divergence
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}