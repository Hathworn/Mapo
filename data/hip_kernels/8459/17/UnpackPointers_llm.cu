#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Calculate global thread index
    const int tx = threadIdx.x + blockIdx.x * blockDim.x;
    int numPts = 0;

    // Iterate over chunks of rows
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            // Ensure accessing within bounds
            if (x + tx < w) {
                unsigned int val = minmax[y * w + x + tx];
                if (val) {
                    for (int k = 0; k < 32; k++) {
                        if ((val & 0x1) && (numPts < maxPts)) {
                            // Calculate and store the pointer
                            ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                            numPts++;
                        }
                        val >>= 1;
                    }
                }
            }
        }
    }
}