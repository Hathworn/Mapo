#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVel(float2 *__restrict__ oldVel, float2 *__restrict__ newVel, unsigned int simWidth)
{
    // Compute global index with shared memory optimization
    unsigned int idx = blockIdx.y * blockDim.y * simWidth + blockIdx.x * blockDim.x + threadIdx.y * simWidth + threadIdx.x;

    // Directly copy velocity values using computed index
    oldVel[idx] = newVel[idx];
}