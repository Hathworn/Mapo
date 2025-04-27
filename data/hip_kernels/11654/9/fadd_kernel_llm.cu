#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fadd_kernel(float *vals, int N, float mu)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x 
            + blockIdx.y * (gridDim.x * blockDim.x) * blockDim.y 
            + threadIdx.y * gridDim.x * blockDim.x;

    // Perform operation only within bounds
    if(idx < N)
        vals[idx] = mu;
}