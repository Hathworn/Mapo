#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Calculate new index by considering multiple threads
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure the operation is performed by only one thread
    if (idx == 0) {
        *accuracy /= N;
    }
}