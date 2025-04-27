#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_rcbrt(int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate 1D thread ID
    if (id < n)
    {
        result[id] = rcbrt(x[id]);  // Compute reciprocal cube root
    }
}