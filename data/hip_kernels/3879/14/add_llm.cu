#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(const float3 *__restrict__ dFinalForce, const unsigned int noRainDrops, float3 *__restrict__ dRainDrops)
{
    // Calculate global thread index
    uint idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by avoiding xSkip computation inside the loop
    uint gridSize = gridDim.x * blockDim.x;

    // Unroll loop to reduce loop overhead
    for (uint i = idx; i < noRainDrops; i += gridSize) {
        dRainDrops[i].x += dFinalForce->x;
        dRainDrops[i].y += dFinalForce->y;
        dRainDrops[i].z += dFinalForce->z;
    }
}