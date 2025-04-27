#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ForwardReLU(float* Z, int nRowsZ, int nColsZ, float* A)
{
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds and apply ReLU 
    if (index < nRowsZ * nColsZ)
    {
        // Use ternary operator for concise conditional assignment
        A[index] = Z[index] >= 0 ? Z[index] : 0;
    }
}