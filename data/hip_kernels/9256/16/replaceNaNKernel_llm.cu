#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void replaceNaNKernel(int numberEntriesPerInstance, int numberIterations, float* source, float* destination) {

    int instanceStart = blockIdx.x * numberEntriesPerInstance;
    int baseIndex = instanceStart + (blockIdx.y * blockDim.x + threadIdx.x) * numberIterations;

    // Loop unrolling for better performance
    #pragma unroll
    for (int i = 0; i < numberIterations; i++) {
        int index = baseIndex + i;
        if (index < instanceStart + numberEntriesPerInstance) {
            float currentValue = source[index];
            destination[index] = __builtin_isnan(currentValue) ? 0.0f : currentValue;
        }
    }
}