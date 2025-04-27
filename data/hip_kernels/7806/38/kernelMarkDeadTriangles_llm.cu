#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMarkDeadTriangles(int *cmarker, short *cnewtri, int nTris) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify calculation of thread index

    if (x < nTris) {  // Merge boundary check with assignment
        cmarker[x] = (cnewtri[x] >= 0 ? 0 : 1);
    }
}