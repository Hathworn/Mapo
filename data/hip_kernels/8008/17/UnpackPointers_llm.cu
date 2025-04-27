```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Use shared memory to optimize access to minmax array
    __shared__ unsigned int sdata[32][16];

    const int tx = threadIdx.x;
    const int bidx = blockIdx.x;
    const int stride = gridDim.x;

    int numPts = 0;

    for (int y = bidx; y < h / 32; y += stride) {
        for (int x = 0; x < w; x += 16) {
            sdata[threadIdx.y][tx] = minmax[(y * 32 + threadIdx.y) * w + x + tx];

            __syncthreads();

            unsigned int val = sdata[threadIdx.y][tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }

            __syncthreads();
        }
    }
}