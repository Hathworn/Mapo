#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Calculate global indices
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    const int by = blockIdx.y;
    const int blockWidth = 16; // Original x increment value

    int numPts = 0;

    // Adjust loop bounds for blocks
    for (int y = by * (h / (gridDim.y)); y < (by + 1) * (h / (gridDim.y)); y++) {
        for (int x = bx * blockWidth; x < (bx + 1) * blockWidth && x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if ((val & 0x1) && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}