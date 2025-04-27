#include "hip/hip_runtime.h"
#include "includes.h"

// Use each thread to divide a portion, assuming accuracy is an array
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        accuracy[idx] /= N;
    }
}