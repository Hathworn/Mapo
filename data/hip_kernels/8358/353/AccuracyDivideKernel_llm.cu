#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Update kernel to perform atomic division for thread-safe operation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        atomicExch(accuracy, *accuracy / N);
    }
}