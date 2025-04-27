```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    // Use shared memory for better performance
    __shared__ unsigned int sharedMinMax[blockDim.x];
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            // Load minmax data into shared memory
            sharedMinMax[tx] = minmax[y * w + x + tx];
            __syncthreads(); // Ensure all threads have loaded minmax data
            
            unsigned int val = sharedMinMax[tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads(); // Ensure all threads complete before next iteration
        }
    }
}