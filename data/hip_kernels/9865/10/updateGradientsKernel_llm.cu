#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateGradientsKernel(float4 *D, float4 *TD, unsigned int nVertices)
{
    int vidx = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    if (vidx < nVertices) {
        // Directly copy 4 elements from TD to D
        D[vidx] = TD[vidx];
        if (vidx + BLOCK_SIZE_AVGG < nVertices) D[vidx + BLOCK_SIZE_AVGG] = TD[vidx + BLOCK_SIZE_AVGG];
        if (vidx + 2 * BLOCK_SIZE_AVGG < nVertices) D[vidx + 2 * BLOCK_SIZE_AVGG] = TD[vidx + 2 * BLOCK_SIZE_AVGG];
        if (vidx + 3 * BLOCK_SIZE_AVGG < nVertices) D[vidx + 3 * BLOCK_SIZE_AVGG] = TD[vidx + 3 * BLOCK_SIZE_AVGG];
    }
}