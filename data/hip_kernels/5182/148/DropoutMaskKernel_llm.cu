#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DropoutMaskKernel(float *dropoutMaskPtr, float dropout, int inputSize)
{
    // Calculate global thread index
    int i = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    // Ensure the thread index does not exceed input size
    if (i < inputSize)
    {
        // Use ternary operator to simplify condition
        dropoutMaskPtr[i] = (dropout > dropoutMaskPtr[i]) ? 1.0f : 0.0f;
    }
}