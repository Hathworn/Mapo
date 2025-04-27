#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Optimize thread indexing
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    const int bDimX = blockDim.x;
    int numPts = 0;
    
    // Unroll outer loop and reduce condition checks
    for (int y = bx; y < h/32; y += gridDim.x) { // Utilize grid for outer loop
        for (int base_x = tx; base_x < w; base_x += bDimX) { // Utilize block for inner loop
            unsigned int val = minmax[y * w + base_x];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + base_x;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}