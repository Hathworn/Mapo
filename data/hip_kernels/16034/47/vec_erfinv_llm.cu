#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_erfinv (int n, double *result, double *y)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure id is within bounds
    if (id < n)
    {
        // Calculate inverse error function
        result[id] = erfinv(y[id]);
    }
}