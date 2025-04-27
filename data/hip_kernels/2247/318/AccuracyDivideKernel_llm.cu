#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Avoid dereferencing and dividing in a single step
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) {
        *accuracy /= N;
    }
}