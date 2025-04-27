#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    const int sharedHeight = h / 32;
    const int blockWidth = w / 16;
    
    for (int y = 0; y < sharedHeight; y++) {
        for (int bx = 0; bx < blockWidth; bx++) {
            int x = bx * 16;
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                #pragma unroll // Unroll inner loop for the constant range
                for (int k = 0; k < 32; k++) {
                    if ((val & 0x1) && (numPts < maxPts)) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1; // Shift value by one bit
                }
            }
        }
    }
}