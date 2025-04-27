#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    y[idx] = 2.0 * x[idx]; // Perform computation on global index
}