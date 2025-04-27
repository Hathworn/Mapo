#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateGradientsKernel(float4 *D, float4 *TD, unsigned int nVertices)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop manually for four iterations
    if (4*idx < nVertices) D[4*idx] = TD[4*idx];
    if (4*idx + 1 < nVertices) D[4*idx + 1] = TD[4*idx + 1];
    if (4*idx + 2 < nVertices) D[4*idx + 2] = TD[4*idx + 2];
    if (4*idx + 3 < nVertices) D[4*idx + 3] = TD[4*idx + 3];
}