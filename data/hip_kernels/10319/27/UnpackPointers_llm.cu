#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    // Optimize loop bounds and memory access pattern
    for (int y = 0; y < h; y += 32) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[(y/32)*w + x + tx];
            while (val && numPts < maxPts) {
                // Find the position of the next set bit (if any)
                int k = __ffs(val) - 1;
                if (k != -1 && numPts < maxPts) {
                    ptrs[16 * numPts + tx] = (y + k) * w + x + tx;
                    numPts++;
                }
                // Reset the found bit
                val &= ~(1U << k);
            }
        }
    }
}