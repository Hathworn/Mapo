#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void daxpy_kernel(int n, double a, double *x, double *y)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop to allow coalesced access and increase occupancy
    for (int idx = i; idx < n; idx += gridDim.x * blockDim.x)
    {
        y[idx] = a * x[idx] + y[idx];
    }
}