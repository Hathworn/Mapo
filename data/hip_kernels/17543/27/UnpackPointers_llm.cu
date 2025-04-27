#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Calculate stride for y loop to optimize memory usage
    const int yStride = w * 32;
    const int xStride = 16;

    // Optimized loop to reduce number of iterations
    for (int y = 0; y < h; y += 32) {
        for (int x = 0; x < w; x += xStride) {
            unsigned int val = minmax[(y / 32) * w + x + tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[numPts * xStride + tx] = (y + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}