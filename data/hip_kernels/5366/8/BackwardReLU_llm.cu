#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BackwardReLU(float* Z, float* dA, int nRowsdZ, int nColsdZ, float* dZ)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int totalElements = nRowsdZ * nColsdZ;

    // Ensure index is within bounds
    if (index < totalElements)
    {
        // Use ternary operator for concise conditional operation
        dZ[index] = (Z[index] >= 0) ? dA[index] : 0;
    }
}