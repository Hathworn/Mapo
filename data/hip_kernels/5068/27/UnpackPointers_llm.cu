#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    
    // Precompute some values outside the loops
    int h32 = h / 32;
    int warpWidth = 32;
    
    for (int y = 0; y < h32; y++) {
        for (int x = 0; x < w; x += warpWidth) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                int xOffset = (y * warpWidth) * w + x + tx;
                while (val && numPts < maxPts) { // Use while loop for efficiency
                    if (val & 0x1) {
                        ptrs[numPts * warpWidth + tx] = xOffset + (numPts % warpWidth) * w; // Optimize index computation
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}