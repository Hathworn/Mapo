#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Loop unrolling and using shared memory for minor performance gain
    extern __shared__ unsigned int sharedMinmax[];

    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            sharedMinmax[tx] = minmax[y * w + x + tx];

            if (sharedMinmax[tx]) {
                unsigned int val = sharedMinmax[tx];
                #pragma unroll
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