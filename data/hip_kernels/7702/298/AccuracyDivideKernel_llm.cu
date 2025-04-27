#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with block and thread indexing
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (idx == 0) {  // Let only the first thread perform the division
        *accuracy /= N;
    }
}