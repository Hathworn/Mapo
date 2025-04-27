#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    
    // Calculate starting position for each thread.
    int block_x = blockIdx.x * 16 + tx;
    
    // Loop through y positions in parallel with stride of the number of blocks
    for (int y = blockIdx.y; y < h / 32; y += gridDim.y) {
        // Loop through x positions in parallel, each thread handles a column
        if (block_x < w) {
            unsigned int val = minmax[y * w + block_x];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + block_x;
                        numPts++;
                    }
                    val >>= 1; // Shift right using the current thread
                }
            }
        }
    }
}