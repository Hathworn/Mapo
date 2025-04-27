#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelAdd(float *dvalues, int numOperations, int firstInd, int nextColInd)
{
    int vi = firstInd + blockIdx.x * blockDim.x + threadIdx.x;
    
    if (vi < nextColInd) {
        float val = dvalues[vi]; // Load value once to avoid redundant accesses
        for (int j = 0; j < numOperations; ++j) {
            // Use local variable for repeated calculation to reduce global memory access
            // Optimize the operation on the nonzero of the sparse matrix:
            dvalues[vi] /= val + val * val; 
        }
    }
}