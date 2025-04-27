```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to divide accuracy by N in parallel
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index
    if (idx == 0) { // Perform division only in the first thread
        *accuracy /= N;
    }
}