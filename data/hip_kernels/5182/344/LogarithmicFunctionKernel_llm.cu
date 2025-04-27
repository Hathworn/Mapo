```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LogarithmicFunctionKernel(float* input, float* output, int size, const int type)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x; // Simplify ID calculation

    if (id < size)
    {
        float val = input[id]; // Cache input value in a register for reuse
        switch (type)
        {
        case 1:
            output[id] = logf(val);
            break;
        case 2:
            output[id] = log2f(val);
            break;
        case 3:
            output[id] = log10f(val);
            break;
        }
    }
}