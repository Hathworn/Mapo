```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    int width = w / 16;
    int height = h / 32;

    // Loop tiling to improve memory access patterns
    for (int y = 0; y < height; ++y) {
        for (int x = 0; x < width; ++x) {
            unsigned int val = minmax[y * w + x * 16 + tx];
            if (val) {
                int baseIdx = y * 32 * w + x * 16 + tx;
                
                #pragma unroll // Unroll loop for performance
                for (int k = 0; k < 32; ++k) {
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