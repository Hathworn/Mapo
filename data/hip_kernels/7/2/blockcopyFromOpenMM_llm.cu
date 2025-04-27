#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blockcopyFromOpenMM(float *target, float *source, int *blocks, int numblocks, int setnum, int N) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;
    if (blockNum >= numblocks)
        return; // Out of bounds check for blockNum
    
    int dof = 3 * blocks[blockNum] + setnum;
    int atom = dof / 3;

    if(atom >= N || (blockNum != numblocks - 1 && atom >= blocks[blockNum + 1])) {
        return; // Out of bounds
    }

    target[dof] = source[(dof + atom + 1)]; // Directly use source index without calculating with sizeof
}