#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelFillEmptySlots1(short *cnewtri, int *cprefix, int *cempty, int *ctriangles, int nTris, int newnTris, int offset)
{
    int x = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    if (x >= nTris || cnewtri[x] < 0)
        return;

    int value;

    if (x < newnTris)
        value = x;
    else {
        value = cempty[cprefix[x] - offset]; // Determine empty slot index

        int base_src = x * 9; // Source index for ctriangles
        int base_dst = value * 9; // Destination index for ctriangles
        
        for (int i = 0; i < 9; i++) // Loop to copy the triangle
            ctriangles[base_dst + i] = ctriangles[base_src + i];
    }

    cprefix[x] = value; // Store the value in cprefix
}