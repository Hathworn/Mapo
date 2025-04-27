#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSmult_kernel(unsigned int size, const float *x1, const float *x2, float *y)
{
    // Calculate global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use consistency with built-in variable names
    if (index < size) {
        // Perform the multiplication for the current index
        y[index] = x1[index] * x2[index];
    }
}