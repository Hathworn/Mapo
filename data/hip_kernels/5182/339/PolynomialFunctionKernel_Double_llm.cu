```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function using 2D grid and reducing multiplication
__global__ void PolynomialFunctionKernel_Double(float a3, float a2, float a1, float a0, double* input, double* output, int size)
{
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x; // Calculate global thread ID

    if (id < size)
    {
        double x = input[id];
        double x2 = x * x; // Pre-compute x squared
        output[id] = (a3 * x2 + a2) * x2 + a1 * x + a0; // Minimize calculations by rearranging
    }
}