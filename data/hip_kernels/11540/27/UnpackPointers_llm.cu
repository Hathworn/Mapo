#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Optimize loop limits and data access patterns
    const int stride = blockDim.x;

    for (int y = 0; y < h / 32; y++) {
        for (int x = tx; x < w; x += stride) {
            unsigned int val = minmax[y * w + x];

            if (val) {
                #pragma unroll // Unroll the inner loop for better performance
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}