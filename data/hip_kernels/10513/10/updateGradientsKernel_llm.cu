#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateGradientsKernel(float4 *D, float4 *TD, unsigned int nVertices)
{
    // Calculate global thread index
    int localIdx = threadIdx.x;
    int vidx = 4 * (blockIdx.x * blockDim.x) + localIdx; 
    
    // Unroll the loop for better performance
    D[vidx] = TD[vidx];
    D[vidx + BLOCK_SIZE_AVGG] = TD[vidx + BLOCK_SIZE_AVGG];
    D[vidx + 2 * BLOCK_SIZE_AVGG] = TD[vidx + 2 * BLOCK_SIZE_AVGG];
    D[vidx + 3 * BLOCK_SIZE_AVGG] = TD[vidx + 3 * BLOCK_SIZE_AVGG];
}