#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Launch only one thread; avoid unnecessary parallelism
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}