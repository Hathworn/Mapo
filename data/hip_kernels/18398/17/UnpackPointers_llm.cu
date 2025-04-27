#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Optimize by calculating y and x increment more effectively
    for (int y = 0; y < h; y += 32) {
        for (int x = tx; x < w; x += 16) {
            unsigned int val = minmax[y * w + x];
            if (val) {
                int baseIdx = y * w + x;  // Base index calculation outside loop
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = baseIdx + k * w;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}