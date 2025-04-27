#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_mul_fl (int n, float *result, float *x, float *y)
{
    // Calculate the unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only if id is within bounds
    if (id < n)
    {
        result[id] = x[id] * y[id];
    }
}