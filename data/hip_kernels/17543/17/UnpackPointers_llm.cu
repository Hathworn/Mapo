#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    const int gridSizeX = gridDim.x * blockDim.x;
    int numPts = 0;

    for (int y = bx; y < h / 32; y += gridSizeX / 16) {  // Efficient index calculation for y
        for (int x = tx; x < w; x += blockDim.x) {  // Efficient index calculation for x
            unsigned int val = minmax[y * w + x];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    // Unroll the loop for performance improvement
                    #pragma unroll
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[gridSizeX * numPts + x] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}