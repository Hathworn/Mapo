#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PolynomialFunctionKernel_Double(float a3, float a2, float a1, float a0, double* input, double* output, int size)
{
    // Improved 1D block and grid indexing for better performance
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < size)
    {
        // Minimize redundant memory access by storing result in a register
        double x = input[id];
        output[id] = fma(fma(fma(a3, x, a2) * x, a1, a0), x, a0); // Utilize FMA for better accuracy and performance
    }
}