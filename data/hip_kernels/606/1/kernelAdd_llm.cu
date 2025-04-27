#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelAdd(float *dvalues, int numOperations, int firstInd, int nextColInd)
{
    int vi = firstInd + blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread operation is within bounds
    if (vi < nextColInd) {
        float value = dvalues[vi]; // Cache data value to register for fast access
        for (int j = 0; j < numOperations; ++j) {
            value *= value + value * value; // Perform computation using cached value
        }
        dvalues[vi] = value; // Write back to global memory
    }
}