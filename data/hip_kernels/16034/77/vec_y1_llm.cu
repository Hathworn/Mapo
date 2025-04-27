#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_y1 (int n, double *result, double *x)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * blockDim.x * gridDim.x;

    // Ensure the thread ID is within bounds
    if (id < n)
    {
        // Compute the Bessel function of the second kind for input value
        result[id] = y1(x[id]);
    }
}