#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    const int stride = blockDim.x; // Use block dimension for stride
    const int numRows = h / 32; // Precompute h/32 outside the loop

    for (int y = 0; y < numRows; ++y) {
        for (int x = tx; x < w; x += stride) { // Iterate with stride for x
            unsigned int val = minmax[y * w + x];
            if (val) {
                for (int k = 0; k < 32; ++k) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[stride * numPts + tx] = (y * 32 + k) * w + x;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}