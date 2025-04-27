#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Check to ensure the current thread can process the input
    if (idx < N) {
        accuracy[idx] /= N;
    }
}