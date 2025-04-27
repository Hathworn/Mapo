#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divide(float *x, float* y, float* out, const int size)
{
    // Calculate the global index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within range
    if (index < size)
    {
        // Perform the division
        out[index] = x[index] / y[index];
    }
}