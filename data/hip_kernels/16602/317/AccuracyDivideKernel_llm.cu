#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Simplified code to utilize block and thread index for scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        *accuracy /= N;
    }
}