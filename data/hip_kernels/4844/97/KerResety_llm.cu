#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerResety(unsigned n, unsigned ini, float3 *v)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (p < n) // Check if thread index is within bounds
    {
        v[p + ini].y = 0; // Reset y component
    }
}