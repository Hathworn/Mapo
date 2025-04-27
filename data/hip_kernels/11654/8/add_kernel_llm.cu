#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_kernel(double *vals, double *ans, int N, double mu)
{
    // Calculate global thread index more concisely
    int idx = blockIdx.x * blockDim.x * blockDim.y * blockDim.z 
            + blockIdx.y * gridDim.x * blockDim.x * blockDim.y * blockDim.z 
            + threadIdx.z * blockDim.y * blockDim.x 
            + threadIdx.y * blockDim.x 
            + threadIdx.x;

    if(idx < N)
        ans[idx] = vals[idx] + mu;
}