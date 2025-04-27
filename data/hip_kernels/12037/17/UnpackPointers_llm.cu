#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    const int by = blockIdx.y;

    int numPts = 0;
    for (int y = by; y < h / 32; y += gridDim.y) { // Unroll loop by blockDim.y
        for (int x = bx * 16; x < w; x += gridDim.x * 16) { // Process by blockDim.x
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
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