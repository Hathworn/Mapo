#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fNegation(const float* arguments, float* results, const long size) {
    // Calculate the global index for the current thread
    const int index = blockIdx.x + blockIdx.y * gridDim.x + threadIdx.x * gridDim.x * gridDim.y;

    // Ensure the thread operates within the bounds of the data
    if(index < size) {
        results[index] = -arguments[index];
    }
}