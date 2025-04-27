#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divide(float *x, float* y, float* out, const int size)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate the stride

    // Loop over elements with stride step
    for (int i = index; i < size; i += stride) 
    {
        out[i] = x[i] / y[i]; // Perform division
    }
}