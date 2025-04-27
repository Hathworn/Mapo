#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Retrieve the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Execute division only if the thread index is zero
    if (idx == 0) {
        *accuracy /= N;
    }
}