#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Calculate the start and step for x to allow more threads to work on different x positions.
    for (int y = blockIdx.y; y < h/32; y += gridDim.y) { // Allow multiple blocks along y
        for (int x = threadIdx.x + blockIdx.x * blockDim.x; x < w; x += blockDim.x * gridDim.x) { // Spread x across threads
            unsigned int val = minmax[y * w + x];

            if (val) {
                for (int k = 0; k < 32; k++) {
                    if ((val & 0x1) && (numPts < maxPts)) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x;
                        numPts++;
                    }
                    // Move the bits of val to the right, to process the next point.
                    val >>= 1;
                }
            }
        }
    }
}