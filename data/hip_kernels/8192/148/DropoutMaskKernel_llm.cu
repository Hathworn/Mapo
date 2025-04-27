#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DropoutMaskKernel(float *dropoutMaskPtr, float dropout, int inputSize)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Ensure within bounds
    if (i < inputSize)
    {
        // Use ternary operator for condition assignment
        dropoutMaskPtr[i] = dropout > dropoutMaskPtr[i] ? 1.0f : 0.0f;
    }
}