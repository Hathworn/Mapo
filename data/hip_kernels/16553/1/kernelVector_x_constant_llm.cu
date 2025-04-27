#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelVector_x_constant(float* arr, int n, int k)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (idx < n)
    {
        // Perform multiplication by constant
        arr[idx] *= k; // Optimize by using shorthand operator
    }
}