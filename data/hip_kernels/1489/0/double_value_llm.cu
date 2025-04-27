#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with block and thread indexing
__global__ void double_value(double *x, double *y)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    y[idx] = 2.0 * x[idx]; // Perform operation with global index
}