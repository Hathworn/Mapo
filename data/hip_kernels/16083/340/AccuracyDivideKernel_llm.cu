```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use thread id 0 for computation to reduce atomic contention
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *accuracy /= N;
    }
}