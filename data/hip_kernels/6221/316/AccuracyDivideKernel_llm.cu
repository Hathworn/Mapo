#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using thread index to ensure operation is done by only one thread
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}