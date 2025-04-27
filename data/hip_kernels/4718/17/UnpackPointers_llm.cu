```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int stride = 32 * w;
    int numPts = 0;

    for (int y = 0; y < h; y += 32) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[(y * w + x) / 32 + tx];
            if (val) {
                for (int k = 0; k < 32; ++k) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y + k) * w + x + tx; // Direct pointer calculation
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}