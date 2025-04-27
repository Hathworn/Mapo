#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockId.x == 0 and threadId.x == 0 to ensure only one thread updates accuracy
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;
    }
}