#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx and threadIdx to ensure each thread processes a unique element
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        // Perform division only if index is within bounds
        accuracy[idx] /= N;
    }
}