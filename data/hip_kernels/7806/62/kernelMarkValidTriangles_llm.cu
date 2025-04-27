```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMarkValidTriangles(short *cnewtri, int *cvalid, int nTris)
{
    int x = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    // Early exit if the index exceeds number of triangles
    if (x >= nTris)
        return;

    // Check validity and mark the triangle in cvalid
    cvalid[x] = (cnewtri[x] >= 0) ? 1 : 0;
}