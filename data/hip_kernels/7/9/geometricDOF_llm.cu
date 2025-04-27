#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void geometricDOF(float *Qi_gdof, float4 *positions, float *masses, int *blocknums, int *blocksizes, int largestsize, float *norm, float *pos_center) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;

    // Pre-compute offsets and reduce calculation inside the loop
    int baseIdx = blockNum * largestsize * 6;
    int blockSize = blocksizes[blockNum];
    int blockStart = blocknums[blockNum];

    // Loop through atoms in blocks
    for (int j = 0; j < blockSize - 3; j += 3) {
        int atom = (blockStart + j) / 3;
        float mass = masses[atom];
        float factor = sqrt(mass) / norm[atom];

        // Fill the diagonal
        Qi_gdof[baseIdx + j * 6 + 0] = factor;
        Qi_gdof[baseIdx + (j + 1) * 6 + 1] = factor;
        Qi_gdof[baseIdx + (j + 2) * 6 + 2] = factor;

        // Compute differences
        float diff0 = positions[atom].x - pos_center[atom * 3 + 0];
        float diff1 = positions[atom].y - pos_center[atom * 3 + 1];
        float diff2 = positions[atom].z - pos_center[atom * 3 + 2];

        // Fill the off-diagonal
        Qi_gdof[baseIdx + (j + 1) * 6 + 3] = diff2 * factor;
        Qi_gdof[baseIdx + (j + 2) * 6 + 3] = -diff1 * factor;

        Qi_gdof[baseIdx + j * 6 + 4] = -diff2 * factor;
        Qi_gdof[baseIdx + (j + 2) * 6 + 4] = -diff0 * factor;

        Qi_gdof[baseIdx + j * 6 + 5] = diff1 * factor;
        Qi_gdof[baseIdx + (j + 1) * 6 + 5] = -diff0 * factor;
    }

    // Normalize first vector
    float rotnorm = 0.0f;
    for (int j = 0; j < blockSize; j++) {
        rotnorm += Qi_gdof[baseIdx + j * 6 + 3] * Qi_gdof[baseIdx + j * 6 + 3];
    }

    rotnorm = rsqrtf(rotnorm); // Use fast inverse square root for normalization

    for (int j = 0; j < blockSize; j++) {
        Qi_gdof[baseIdx + j * 6 + 3] *= rotnorm;
    }
}