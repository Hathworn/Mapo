#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AbsoluteValueKernel(float* input, float* output, int size)
{
    // Optimize index calculation to reduce arithmetic operations
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Execute only for valid indices
    if (id < size)
    {
        output[id] = fabsf(input[id]); // Using fast math library function
    }
}