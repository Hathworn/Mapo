#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" __global__ void fHadamard(const float* argumentsA, const float* argumentsB, float* results, const long size) {
    // Calculate 1D global index for current thread
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Bounds check to ensure thread does not operate out of allocated memory
    if (index < size) {
        results[index] = argumentsA[index] * argumentsB[index];
    }
}