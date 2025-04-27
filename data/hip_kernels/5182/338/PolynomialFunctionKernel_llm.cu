#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PolynomialFunctionKernel(float a3, float a2, float a1, float a0, float* input, float* output, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify global ID calculation (2D to 1D)

    if (id < size)
    {
        float x = input[id];
        output[id] = ((a3 * x + a2) * x + a1) * x + a0; // Optimize polynomial calculation using Horner's method
    }
}