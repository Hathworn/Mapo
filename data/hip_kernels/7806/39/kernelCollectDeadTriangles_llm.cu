#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelCollectDeadTriangles(int *cdeadTri, short *cnewtri, int *cmarker, int nTris) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid

    if (x >= nTris || cnewtri[x] >= 0) // Boundary and condition check
        return;

    int id = cmarker[x];
    cdeadTri[id] = x; // Assign dead triangle index
}