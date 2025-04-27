#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExponentialFunctionKernel(float exponent, float* input, float* output, int size)
{
    // Use single dimensional grid for easier threading
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid recomputing the block index for each dimension
    if (id < size)
    {
        // Use expf for single precision exponential calculation
        output[id] = expf(exponent * logf(input[id]));
    }
}