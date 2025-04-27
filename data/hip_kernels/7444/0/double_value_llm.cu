#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Use blockIdx and blockDim to handle larger arrays
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Assuming grid is launched with enough threads
    y[idx] = 2.0 * x[idx];
}