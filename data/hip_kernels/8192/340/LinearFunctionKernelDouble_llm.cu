#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LinearFunctionKernelDouble(double a1, double a0, double* input, double* output, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified global thread ID calculation

    if (id < size)
    {
        output[id] = a1 * input[id] + a0; // Direct computation without unnecessary variable
    }
}