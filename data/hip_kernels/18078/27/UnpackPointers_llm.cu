#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    // Load h/32 into register to avoid repeated computation
    int hDiv32 = h / 32;
    for (int y = 0; y < hDiv32; y++) {
        for (int x = 0; x < w; x += 16) {
            // Precompute the base index to minimize computation inside loops
            int baseIdx = y * w + x;
            unsigned int val = minmax[baseIdx + tx];
            if (val) {
                for (int k = 0; k < 32 && numPts < maxPts; k++) {
                    if (val & 0x1) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}