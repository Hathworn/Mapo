#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_trunc(int n, double *result, double *x)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int id = blockIdx.y * gridDim.x * blockDim.x + idx;

    // Check if thread id is within bounds.
    if (id < n)
    {
        result[id] = trunc(x[id]);
    }
}