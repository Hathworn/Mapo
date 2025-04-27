#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use threadIdx.x to uniquely assign each thread to a task
    int tid = threadIdx.x;
    if (tid == 0) {  // Only a single thread needs to perform the division
        *accuracy /= N;
    }
}