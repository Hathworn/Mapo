#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fDerSigmoid(const float* arguments, float* results, const long size) {
    // Calculate global index using 1D grid and block
    const int index = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < size) {
        const float argument = arguments[index];
        results[index] = argument - argument * argument;
    }
}