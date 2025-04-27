#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int blockYOffset = blockIdx.y * 32; // Compute block offset for y
    int numPts = 0;

    if (blockYOffset < h) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[blockYOffset * w + x + tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        // Compute global index directly
                        ptrs[16 * numPts + tx] = (blockYOffset + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}