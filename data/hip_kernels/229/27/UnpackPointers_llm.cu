#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Optimize loop unrolling and memory access
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            int ptrIndex = 0;

            while (val && numPts < maxPts) {
                if (val & 0x1) {
                    ptrs[16 * numPts + tx] = (y * 32 + ptrIndex) * w + x + tx;
                    numPts++;
                }
                val >>= 1;
                ptrIndex++;
            }
        }
    }
}