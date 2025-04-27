#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block and thread indices for parallelism, reduce operations in global memory
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index == 0) {
        *accuracy /= N;
    }
}