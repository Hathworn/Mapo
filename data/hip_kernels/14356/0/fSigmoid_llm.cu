#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fSigmoid(const float* arguments, float* results, const long size) {
    // Optimize index calculation using blockDim and blockIdx
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and compute sigmoid
    if (index < size) {
        results[index] = 1.f / (1.f + expf(-arguments[index]));
    }
}