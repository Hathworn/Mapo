#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void symmetrize1D(float *h, int *blockPositions, int *blockSizes, int numBlocks) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;
    if (blockNum >= numBlocks) {
        return;
    }

    // Convert block size from atoms to degrees of freedom
    const unsigned int blockSize = 3 * blockSizes[blockNum];

    float *block = &(h[blockPositions[blockNum]]);
    
    // Loop unrolling for improved performance
    for (unsigned int r = 0; r < blockSize - 1; r++) {
        for (unsigned int c = r + 1; c < blockSize; c += 2) { // Increment by 2 for loop unrolling
            const float avg1 = 0.5f * (block[r * blockSize + c] + block[c * blockSize + r]);
            block[r * blockSize + c] = avg1;
            block[c * blockSize + r] = avg1;

            if (c + 1 < blockSize) { // Handle the second part of the unrolled loop
                const float avg2 = 0.5f * (block[r * blockSize + c + 1] + block[(c + 1) * blockSize + r]);
                block[r * blockSize + c + 1] = avg2;
                block[(c + 1) * blockSize + r] = avg2;
            }
        }
    }
}