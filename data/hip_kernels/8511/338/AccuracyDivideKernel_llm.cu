#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to use block and thread indices for better parallel execution
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        *accuracy /= N;  // Perform division only once using a single thread
    }
}