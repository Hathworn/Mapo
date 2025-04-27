#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void perturbPositions(float *blockpos, float4 *initpos, float delta, int *blocks, int numblocks, int setnum, int N) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (blockNum >= numblocks) {
        return;
    }
    
    int dof = 3 * blocks[blockNum] + setnum;
    int atom = dof / 3;

    // Ensure atom is within bounds
    if (atom >= N || (blockNum != (numblocks - 1) && atom >= blocks[blockNum + 1])) {
        return;
    }

    int axis = dof % 3;

    // Use a switch statement for cleaner code
    switch (axis) {
        case 0:
            blockpos[dof] = initpos[atom].x;
            initpos[atom].x += delta;
            break;
        case 1:
            blockpos[dof] = initpos[atom].y;
            initpos[atom].y += delta;
            break;
        case 2:
            blockpos[dof] = initpos[atom].z;
            initpos[atom].z += delta;
            break;
    }
}