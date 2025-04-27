#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerResety(unsigned n, unsigned ini, float3 *v)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global particle index

    // Check boundary condition before assignment
    if (p < n) {
        v[p + ini].y = 0; // Reset y component
    }
}