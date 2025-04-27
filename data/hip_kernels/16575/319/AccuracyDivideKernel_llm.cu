#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Perform division operation safely
    if (N != 0) {
        *accuracy /= N; 
    }
}