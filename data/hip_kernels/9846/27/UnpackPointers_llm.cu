#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Using shared memory to reduce global memory access latency
    __shared__ unsigned int sharedVal[32];
    
    const int tx = threadIdx.x;
    int numPts = 0;

    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            sharedVal[tx] = minmax[y * w + x + tx];
            __syncthreads(); // Ensure all threads have loaded to sharedVal

            unsigned int val = sharedVal[tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    // Check bit and the numPts condition in a single evaluation
                    if ((val & 0x1) && (numPts < maxPts)) {
                        // Avoid bank conflicts when writing to ptrs
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            
            __syncthreads(); // Ensure all threads have finished processing the segment
        }
    }
}