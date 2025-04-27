#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Thread 0 is responsible for dividing accuracy by N
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}