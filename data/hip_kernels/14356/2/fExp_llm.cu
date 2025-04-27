#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void fExp(const float* arguments, float* results, const long size) {
    // Optimize index calculation using blockIdx.x and blockIdx.y directly
    const int index = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread-safe memory access and calculate exponent if index is valid
    if(index < size) {
        results[index] = expf(arguments[index]);
    }
}