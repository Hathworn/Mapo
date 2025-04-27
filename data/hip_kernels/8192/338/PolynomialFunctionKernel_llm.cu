#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PolynomialFunctionKernel(float a3, float a2, float a1, float a0, float* input, float* output, int size)
{
    // Use a 1D block index calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if(id < size)
    {
        float x = input[id];
        // Calculate the polynomial in one line
        output[id] = fmaf(fmaf(fmaf(a3, x, a2) * x, a1) * x, a0);
    }
}