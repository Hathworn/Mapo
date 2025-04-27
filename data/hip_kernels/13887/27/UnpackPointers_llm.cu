#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Use shared memory to reduce global memory access
    __shared__ unsigned int sharedMinmax[32 * 16];

    const int tx = threadIdx.x;
    int numPts = 0;
    
    for (int y = 0; y < h / 32; y++) {
        // Load minmax values into shared memory
        for (int x = 0; x < w; x += 16) {
            sharedMinmax[tx] = minmax[y * w + x + tx];
            __syncthreads();  // Synchronize threads to ensure shared memory is updated

            unsigned int val = sharedMinmax[tx];

            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        // Calculate and store index using shared memory
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads();  // Synchronize threads after processing
        }
    }
}