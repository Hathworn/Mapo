#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFixVertArray1(int *ctriangles, int nTris, int *cvertarr)
{
    // Calculate the unique thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Early return if thread index is out of bounds
    if (x >= nTris)
        return;

    // Load triangle vertices from global memory
    int v0 = ctriangles[x * 9 + 4];
    int v1 = ctriangles[x * 9 + 5];
    int v2 = ctriangles[x * 9 + 3];

    // Atomic exchange operations to update vertex array
    ctriangles[x * 9 + 6] = atomicExch(&cvertarr[v0], (x << 2));
    ctriangles[x * 9 + 7] = atomicExch(&cvertarr[v1], (x << 2) | 1);
    ctriangles[x * 9 + 8] = atomicExch(&cvertarr[v2], (x << 2) | 2);
}