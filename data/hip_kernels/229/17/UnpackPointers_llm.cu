#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    // Unroll outer loop to improve memory coalescing
    for (int y = 0; y < h; y += 32) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[(y/32)*w + x + tx];
            if (val) {
                #pragma unroll // Unrolling inner loop for better performance
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}