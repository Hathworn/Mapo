#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Each thread computes part of the division
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        float threadAcc = accuracy[idx];
        accuracy[idx] = threadAcc / N;
    }
}