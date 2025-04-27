#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Divide only if thread 0 executes (single execution for division)
    if (threadIdx.x == 0) {
        *accuracy /= N;
    }
}