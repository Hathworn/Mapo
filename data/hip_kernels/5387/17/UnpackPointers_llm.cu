#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    const int dimThread = 16;  // Number of threads working concurrently on x-axis block
    int numPts = 0;
    
    // Calculate block's starting x-coordinate and step through every 16 lines
    for (int y = bx; y < h / 32; y += gridDim.x) {
        for (int x = 0; x < w; x += dimThread) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                for (int k = 0; k < 32 && numPts < maxPts; k++) {
                    if (val & 0x1) {
                        // Calculate pointer position and increment safely if within maxPts
                        int ptrIdx = atomicAdd(&numPts, (numPts < maxPts) ? 1 : 0);
                        if (ptrIdx < maxPts) {
                            ptrs[dimThread * ptrIdx + tx] = (y * 32 + k) * w + x + tx;
                        }
                    }
                    val >>= 1;  // Right shift the bits of val
                }
            }
        }
    }
}