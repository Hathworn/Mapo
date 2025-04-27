#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Compute global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Double the value if within bounds
    if (index < 1024) // Assumes a predefined size, replace 1024 with actual size if needed
    {
        y[index] = 2.0 * x[index];
    }
}