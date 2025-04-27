#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelAdd(float *dvalues, int numOperations, int firstInd, int nextColInd)
{
    int vi = firstInd + blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index before operations
    if (vi < nextColInd) {
        // Load value into a register to reduce global memory access
        float value = dvalues[vi];
        for (int j = 0; j < numOperations; ++j) {
            // Use register value for operations
            value *= value + value * value;
        }
        // Store the result back to global memory
        dvalues[vi] = value;
    }
}