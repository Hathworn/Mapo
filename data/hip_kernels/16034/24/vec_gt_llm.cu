#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_gt(int n, double *result, double *x, double *y)
{
    // Compute global thread ID using 1D grid and 1D block for simplicity
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (id < n)
    {
        // Compare elements and assign result
        result[id] = (x[id] > y[id]) ? 1.0 : 0.0;
    }
}