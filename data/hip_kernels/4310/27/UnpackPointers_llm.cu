#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int blockW = w / 16;
    int numPts = 0;

    for (int y = blockIdx.y; y < h / 32; y += gridDim.y) {    // Optimize: Use grid-stride to maximize parallelism
        for (int xBlock = blockIdx.x; xBlock < blockW; xBlock += gridDim.x) { // Optimize: Use grid-stride for x axes
            int x = xBlock * 16;                             // Calculate real x position in memory
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}