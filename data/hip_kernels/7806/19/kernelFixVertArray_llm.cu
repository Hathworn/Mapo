#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFixVertArray(int *ctriangles, int nTris, int *cvertarr)
{
    // Calculate unique global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check bounds
    if (x >= nTris)
        return;

    // Store indices
    int idx = x * 9;

    // Extract vertices
    int v0 = ctriangles[idx + 4];
    int v1 = ctriangles[idx + 5];
    int v2 = ctriangles[idx + 3];

    // Perform atomic exchange operations
    ctriangles[idx + 6] = atomicExch(&cvertarr[v0], (x << 2));
    ctriangles[idx + 7] = atomicExch(&cvertarr[v1], (x << 2) | 1);
    ctriangles[idx + 8] = atomicExch(&cvertarr[v2], (x << 2) | 2);
}