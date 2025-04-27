#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    
    // Optimize loop by using shared memory for reduction
    __shared__ int sharedPtrs[16 * 1024];  // Assuming maxPts cannot exceed this limit

    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        sharedPtrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }

    // Write results from shared memory to global memory safely
    for (int i = 0; i < numPts; i++) {
        ptrs[16 * i + tx] = sharedPtrs[16 * i + tx];
    }
}