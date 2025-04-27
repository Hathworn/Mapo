#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_cosh(int n, double *result, double *x)
{
    // Calculate global index for the thread
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if (id < n)
    {
        result[id] = cosh(x[id]); // Use internal cosh function on input array
    }
}