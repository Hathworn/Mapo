#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blockcopyToOpenMM(float *target, float *source, int *blocks, int numblocks, int setnum, int N) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if blockNum is out of bounds
    if (blockNum >= numblocks)
        return;

    int dof = 3 * blocks[blockNum] + setnum;
    int atom = dof / 3;

    // Combined condition to check if atom is out of bounds
    if (atom >= N || (blockNum + 1 < numblocks && atom >= blocks[blockNum + 1]))
        return; // Out of bounds

    // Efficient memory access pattern
    target[(dof + atom + 1)] = source[dof];
}