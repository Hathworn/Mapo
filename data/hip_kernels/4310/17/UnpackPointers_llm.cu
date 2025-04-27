#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Cache thread index
    const int tx = threadIdx.x;

    // Initialize number of points for current thread
    int numPts = 0;

    // Process only necessary rows to avoid data redundancy
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                // Unroll loop to minimize branch overhead
                #pragma unroll
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}