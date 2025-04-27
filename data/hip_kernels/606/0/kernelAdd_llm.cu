#include "hip/hip_runtime.h"
#include "includes.h"

//=============================================================================
// FILE:   mytoy.cu
// AUTHORS: Raul Segura & Manuel Ujaldon (copyright 2014)
// Look for the string "MU" whenever Manuel suggests you to introduce changes
// Feel free to change some other parts of the code too (at your own risk)
//=============================================================================

//=============================================================================
// CUDA functions.
//=============================================================================

//Error handler for CUDA functions.
__global__ void kernelAdd(float *dvalues, int numOperations, int firstInd, int nextColInd)
{
    int vi = firstInd + blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize: Check boundary condition outside the loop
    if (vi < nextColInd) {
        float tempValue = dvalues[vi];  // Cache value to reduce repeated memory access
        for (int j = 0; j < numOperations; ++j) {
            tempValue *= tempValue + tempValue * tempValue; // Compute using cached value
        }
        dvalues[vi] = tempValue;  // Write back result after loop
    }
}