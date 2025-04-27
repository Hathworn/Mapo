#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void replaceNaNKernel(int numberEntriesPerInstance, int numberIterations, float* source, float* destination) {
    // Calculate the global thread index
    int globalIndex = blockIdx.x * blockDim.x * numberIterations + blockIdx.y * blockDim.x + threadIdx.x;

    // Iterate over elements with a stride equal to the total number of threads
    for (int idx = globalIndex; idx < numberEntriesPerInstance * gridDim.x; idx += blockDim.x * gridDim.y) {
        float currentValue = source[idx];
        destination[idx] = isnan(currentValue) ? 0.0f : currentValue;
    }
}