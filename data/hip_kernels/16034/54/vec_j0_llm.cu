#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_j0(int n, double *result, double *x)
{
    // Calculate the thread's unique index within the grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread index is within bounds
    if (id < n)
    {
        // Perform the computation using the j0 function
        result[id] = j0(x[id]);
    }
}