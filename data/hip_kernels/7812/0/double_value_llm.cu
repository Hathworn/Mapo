#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void double_value(double *x, double *y)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    y[idx] = 2. * x[idx]; // Perform value doubling
}