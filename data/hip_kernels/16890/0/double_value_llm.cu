#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within array bounds
    if (idx < N) // Replace N with the correct array size
    {
        // Perform computation
        y[idx] = 2.0 * x[idx];
    }
}