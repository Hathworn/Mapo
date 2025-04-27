#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Ecalc2(float* out, const float* label) 
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flatten 2D grid to 1D index

    if (i < blockDim.x * gridDim.x)                // Ensure index is within bounds
    {
        out[i] = label[i] - out[i];
    }
}