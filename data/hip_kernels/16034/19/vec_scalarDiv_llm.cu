#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_scalarDiv (int n, double *result, double  x, double  *y)
{
    // Calculate global thread ID in one step for simplicity
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * blockDim.y + threadIdx.y * gridDim.x * blockDim.x;
    
    // Check if the current thread ID is within the bounds
    if (id < n)
    {
        result[id] = x / y[id]; // Calculate division
    }
}