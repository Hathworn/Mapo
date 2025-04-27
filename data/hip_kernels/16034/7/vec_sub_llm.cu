#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_sub(int n, double *result, double *x, double *y)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockDim.x * gridDim.x) * (blockIdx.y * blockDim.y + threadIdx.y);

    // Ensure the thread works on valid data
    if (id < n)
    {
        // Perform element-wise subtraction
        result[id] = x[id] - y[id];
    }
}