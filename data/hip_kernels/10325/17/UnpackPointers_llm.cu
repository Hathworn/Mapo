#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int blockSize = 32; // Define block size
    int numPts = 0;
    
    // Use tidy loops and shared memory when necessary
    for (int y = 0; y < h / blockSize; y++) {
        for (int x = 0; x < w; x += 16) {
            unsigned int val = minmax[y * w + x + tx];
            
            // Check if there are points to process
            if (val && numPts < maxPts) {
                #pragma unroll // Use loop unrolling for efficiency
                for (int k = 0; k < blockSize; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * blockSize + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}