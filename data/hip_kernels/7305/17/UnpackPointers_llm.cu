#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int strideY = w * 32; // Pre-compute strideY for efficiency
    int numPts = 0;

    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];

            if (val) {
                for (int k = 0; k < 32 && numPts < maxPts; k++) { // Limit loop by maxPts
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