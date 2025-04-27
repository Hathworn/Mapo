#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by ensuring thread index calculation and use of shared memory
__global__ void double_value(double *x, double *y)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Consider using shared memory for further optimization if data reused
    y[idx] = 2.0 * x[idx];
}