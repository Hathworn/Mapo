```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int blockSize = blockDim.x;

    int numPts = 0;
    for (int y = 0; y < h / 32; y++) {
        for (int x = tx; x < w; x += blockSize) { // optimize work distribution by blocks
            unsigned int val = minmax[y * w + x];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        int index = atomicAdd(&numPts, 1); // atomic operation for shared counter
                        if (index < maxPts) { // double check within bounds
                            ptrs[16 * index + tx] = (y * 32 + k) * w + x;
                        }
                    }
                    val >>= 1;
                }
            }
        }
    }
}