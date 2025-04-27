#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFixVertArray_Missing(int *ctriangles, int nTris, int *cvertarr)
{
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (x >= nTris) return;

    // Load triangle vertices
    int v0 = ctriangles[x * 9 + 4];
    int v1 = ctriangles[x * 9 + 5];
    int v2 = ctriangles[x * 9 + 3];

    // Store vertex values using atomic exchange
    ctriangles[x * 9 + 6] = atomicExch(&cvertarr[v0], (x << 2));
    ctriangles[x * 9 + 7] = atomicExch(&cvertarr[v1], (x << 2) | 1);
    ctriangles[x * 9 + 8] = atomicExch(&cvertarr[v2], (x << 2) | 2);
}