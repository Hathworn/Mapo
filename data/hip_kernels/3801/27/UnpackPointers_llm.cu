#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Calculate block-wide stride for threads to work on separate y blocks
    const int blockStrideY = gridDim.y * 32;
    const int blockStrideX = blockDim.x * 16;

    // Loop over y and x in a more efficient manner using strides
    for (int y = blockIdx.y * 32; y < h; y += blockStrideY) {
        for (int x = blockIdx.x * blockDim.x * 16; x < w; x += blockStrideX) {
            unsigned int val = minmax[(y/32)*w + x + tx];

            if (val) {
                // Unrolling the loop to handle the val bits could improve efficiency
                for (int k = 0; k < 32 && numPts < maxPts; k++, val >>= 1) {
                    if (val & 0x1) {
                        ptrs[numPts * 16 + tx] = (y + k) * w + x + tx;
                        numPts++;
                    }
                }
            }
        }
    }
}