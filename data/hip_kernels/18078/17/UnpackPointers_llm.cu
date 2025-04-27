#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Define thread index once
    const int tx = threadIdx.x;

    // Use shared memory for numPts
    __shared__ int numPtsShared;
    numPtsShared = 0;

    // Convert loop limits to depend on blockIdx.y for parallel blocks
    for (int y = blockIdx.y; y < h / 32; y += gridDim.y) {
        for (int x = blockIdx.x * 16 + tx; x < w; x += blockDim.x * 16) {
            unsigned int val = minmax[y * w + x];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    // Use atomic operation to safely update numPtsShared
                    if (val & 0x1 && numPtsShared < maxPts) {
                        unsigned int index = atomicAdd(&numPtsShared, 1);
                        if (index < maxPts) {  // Ensure index is within range
                            ptrs[16 * index + tx] = (y * 32 + k) * w + x;
                        }
                    }
                    val >>= 1;
                }
            }
        }
    }
}