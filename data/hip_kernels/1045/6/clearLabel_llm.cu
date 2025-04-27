#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clearLabel(float *prA, float *prB, unsigned int num_nodes, float base)
{
    unsigned int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < num_nodes)
    {
        // Use registers for constant values to reduce redundant calculations
        const float factor = 0.85f;
        prA[id] = base + prA[id] * factor;
        prB[id] = 0;
    }
}