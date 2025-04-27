#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exp_kernel(float* DIST, float pw)
{
    register int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= gridDim.x * blockDim.x) return; // Boundary check
    register float arg = DIST[idx] * pw;
    arg = fmaxf(arg, -70.0f); // Use fmaxf for branchless operation
    DIST[idx] = expf(arg); // Use expf for better performance
}