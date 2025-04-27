#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to compute accuracy by dividing with N
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Using block and thread index to potentially process multiple elements in parallel
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) { 
        accuracy[idx] /= N; // Perform division on each element
    }
}