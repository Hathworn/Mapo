#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void devFillAffectedTriangles(int nFlip, int *pTaff, int *pTaffEdge, int *pEnd, int2 *pEt)
{
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize grid stride loop for enhanced parallelism
    for (; i < nFlip; i += gridDim.x * blockDim.x) {
        int e = pEnd[i];

        // Concurrent access to memory with coalesced approach
        pTaffEdge[i] = i;
        pTaffEdge[i + nFlip] = i;

        pTaff[i] = pEt[e].x;
        pTaff[i + nFlip] = pEt[e].y;
    }
}