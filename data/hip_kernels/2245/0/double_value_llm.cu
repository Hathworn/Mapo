#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void double_value(double *x, double *y)
{
    // Use blockDim and blockIdx for scalability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    y[idx] = 2.0 * x[idx]; // Use consistent floating-point literal
}