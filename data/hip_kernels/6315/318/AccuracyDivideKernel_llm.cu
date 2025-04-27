#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use the first thread in block 0 to perform the division
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}