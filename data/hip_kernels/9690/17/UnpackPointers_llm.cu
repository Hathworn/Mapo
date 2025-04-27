#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Cache threadIdx.x value
    const int tx = threadIdx.x;
    // Loop unrolling to reduce branch overhead
    int numPts = 0;
    const int stride = 32;
    const int widthStride = w / 16;

    for (int y = 0; y < h / stride; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                #pragma unroll
                for (int k = 0; k < stride; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        // Efficient calculation without redundant operations
                        ptrs[16 * numPts + tx] = (y * stride + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}