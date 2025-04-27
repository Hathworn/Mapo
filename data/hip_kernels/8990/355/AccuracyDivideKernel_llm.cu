#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to divide each accuracy element by N using a single thread
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform divide operation using thread 0 only
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}