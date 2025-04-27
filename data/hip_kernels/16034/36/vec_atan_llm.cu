#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_atan (int n, double *result, double *x)
{
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             (blockIdx.y * blockDim.x * gridDim.x) + 
             (threadIdx.y * gridDim.x * blockDim.x);

    // Ensure the thread operates within bounds
    if (id < n)
    {
        result[id] = atan(x[id]);
    }
}