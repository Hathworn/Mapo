#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void double_value(double *x, double *y)
{
    // Compute global thread index for flexible loop handling and coalescing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the global index does not exceed the array bounds
    if (idx < N)
    {
        y[idx] = 2.0 * x[idx];
    }
}