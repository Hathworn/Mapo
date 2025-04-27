#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dset_array_kernel(double *vals, int N, double *mu)
{
    // Calculate global index using the built-in function
    int idx = blockIdx.x * blockDim.x + threadIdx.x
            + blockIdx.y * gridDim.x * blockDim.x * blockDim.y
            + blockIdx.z * gridDim.x * gridDim.y * blockDim.x * blockDim.y * threadIdx.z;

    // Perform the operation only if within bounds
    if(idx < N)
        vals[idx] = mu[0];
}