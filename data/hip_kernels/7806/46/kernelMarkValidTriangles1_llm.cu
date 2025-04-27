```c++
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMarkValidTriangles1(short *cnewtri, int *cvalid, int nTris)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    if (x < nTris) // Merge condition to reduce branching
    {
        cvalid[x] = (cnewtri[x] >= 0) ? 1 : 0;
    }
}