#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Calculate row and column index based on block and thread to improve access pattern
    for (int global_y = blockIdx.y * (h / (32 * gridDim.y)); global_y < (blockIdx.y + 1) * (h / (32 * gridDim.y)); global_y++) {
        for (int x = blockIdx.x * 16; x < (blockIdx.x + 1) * 16 && x < w; x += 16) {
            unsigned int val = minmax[global_y * w + x + tx];

            // Process all bits in `val`
            for (int k = 0; k < 32 && numPts < maxPts; k++) {
                if (val & 0x1) {
                    ptrs[16 * numPts + tx] = (global_y * 32 + k) * w + x + tx;
                    numPts++;
                }
                val >>= 1;
            }
        }
    }
}