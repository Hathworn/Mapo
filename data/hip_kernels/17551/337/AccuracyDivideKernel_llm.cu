#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a single thread to perform division since it's a simple operation
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}