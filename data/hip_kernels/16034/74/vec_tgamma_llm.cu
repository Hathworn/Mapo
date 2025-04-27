#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_tgamma(int n, double *result, double *x)
{
    // Calculate flattened thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (id < n)
    {
        // Compute the gamma function
        result[id] = tgamma(x[id]);
    }
}