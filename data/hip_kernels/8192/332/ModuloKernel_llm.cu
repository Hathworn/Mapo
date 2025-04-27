#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ModuloKernel(float* input, int divisor, float* output, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified 1D grid index calculation
    if (id < size)
    {
        output[id] = fmodf(input[id], divisor);  // Use fmodf for floating-point numbers
    }
}