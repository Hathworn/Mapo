#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LogarithmicFunctionKernel(float* input, float* output, int size, const int type)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate thread index more efficiently

    if (id < size)
    {
        float val = input[id];  // Reduce repeated memory access
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