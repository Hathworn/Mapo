#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    // Loop unrolling for outer y-loop
    #pragma unroll
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                // Utilize bit Intrinsics for bit manipulation
                while (val && numPts < maxPts) {
                    int k = __ffs(val) - 1; // Find first set bit
                    if (k >= 0) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                        val &= val - 1; // Clear the least significant bit set
                    }
                }
            }
        }
    }
}