#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void makeBlockHessian(float *h, float *forces1, float *forces2, float *mass, float blockDelta, int *blocks, int *blocksizes, int numblocks, int *hessiannums, int *hessiansizes, int setnum, int N) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;
    if (blockNum >= numblocks) return; // Ensure within block range

    int dof = 3 * blocks[blockNum] + setnum;
    int atom = dof / 3;
    if (atom >= N || (blockNum != numblocks - 1 && atom >= blocks[blockNum + 1])) {
        return; // Out of bounds
    }

    int start_dof = 3 * blocks[blockNum];
    int end_dof = (blockNum == numblocks - 1) ? 3 * N : 3 * blocks[blockNum + 1];

    // Pre-compute block scale factor
    float invBlockDelta = 1.0 / blockDelta;

    for (int k = start_dof; k < end_dof; k++) {
        // Cache heavy calculations
        float massProduct = mass[atom] * mass[k / 3];
        float blockScale = invBlockDelta / sqrt(massProduct);

        // Compute index once
        int index = hessiannums[blockNum] + (k - start_dof) * (3 * blocksizes[blockNum]) + (dof - start_dof);

        // Optimize memory access pattern
        h[index] = (forces1[k] - forces2[k]) * blockScale;
    }
}