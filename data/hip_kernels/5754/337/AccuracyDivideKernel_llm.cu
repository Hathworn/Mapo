#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread index for potential parallel processing
    int idx = threadIdx.x;
    
    // Ensure single thread execution
    if (idx == 0) {
        *accuracy /= N; // Divide once by N
    }
}