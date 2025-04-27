#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_cbrt(int n, double *result, double *x) 
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds to prevent accessing invalid memory
    if (id < n) 
    {
        // Perform cube root operation
        result[id] = cbrt(x[id]);
    }
}