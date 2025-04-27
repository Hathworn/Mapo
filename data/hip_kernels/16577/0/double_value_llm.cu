#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Double the value at the global index
    y[idx] = 2.0 * x[idx];
}