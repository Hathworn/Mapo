#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Optimize using blockIdx.x as the only thread performs the calculation
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        *accuracy /= N;  // Division operation
    }
}