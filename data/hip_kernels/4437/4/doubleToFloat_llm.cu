#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void doubleToFloat(double* input, float* output, int numElements)
{
    // Calculate the global thread index
    int i = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;

    // Use a stride loop to allow each thread to process multiple elements
    int stride = hipGridDim_x * hipBlockDim_x;
    for (; i < numElements; i += stride) 
    {
        output[i] = static_cast<float>(input[i]);
    }
}