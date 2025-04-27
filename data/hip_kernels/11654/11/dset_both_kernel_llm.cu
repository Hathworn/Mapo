```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dset_both_kernel(double *vals, int N, double mu, float sd)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x * blockDim.y * blockDim.z + 
              blockIdx.y * blockDim.x * blockDim.z + 
              blockIdx.z * blockDim.x + 
              threadIdx.x;
              
    // Check bounds and set value
    if (idx < N)
        vals[idx] = mu + sd;
}