#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use the first thread only as this is a scalar operation
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}