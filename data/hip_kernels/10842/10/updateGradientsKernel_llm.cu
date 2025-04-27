#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateGradientsKernel(float4 *D, float4 *TD, unsigned int nVertices)
{
    int baseIndex = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    
    // Unroll the loop for better performance
    #pragma unroll
    for (int offset = 0; offset < 4 * BLOCK_SIZE_AVGG; offset += BLOCK_SIZE_AVGG)
    {
        D[baseIndex + offset] = TD[baseIndex + offset];
    }
}