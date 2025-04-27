#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_sinh (int n, double *result, double *x)
{
    // Calculate global thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n)
    {
        // Perform sinh operation
        result[id] = sinh(x[id]);
    }
}