#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts) {
    const int tx = threadIdx.x;
    int numPts = 0;
    // Calculate the number of rows to process per block for coalesced memory access
    int rowsPerBlock = h / 32;
    int tidx = blockIdx.x * blockDim.x + tx;

    // Loop over calculated rows and iterate only if within range
    for (int y = 0; y < rowsPerBlock && numPts < maxPts; y++) {
        for (int x = 0; x < w; x += blockDim.x) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                for (int k = 0; val != 0 && k < 32 && numPts < maxPts; k++) {
                    if (val & 0x1) {
                        if (numPts < maxPts) {
                            ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                            numPts++;
                        }
                    }
                    val >>= 1;
                }
            }
        }
    }
}