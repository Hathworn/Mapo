#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Precompute reused values.
    int txOffset = tx + blockIdx.x * blockDim.x;
    
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + txOffset];
            
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + txOffset] = (y * 32 + k) * w + x + txOffset;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}