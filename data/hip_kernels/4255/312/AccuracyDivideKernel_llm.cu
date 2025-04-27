#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use a single thread for division, as only one operation is needed
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}