#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Calculate global thread index for handling larger problem sizes
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform the operation using the calculated global index
    y[idx] = 2. * x[idx];
}