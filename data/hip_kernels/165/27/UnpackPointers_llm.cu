#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    __shared__ unsigned int shared_minmax[16]; // Use shared memory for better performance
    int numPts = 0;

    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            if (tx < 16) {
                shared_minmax[tx] = minmax[y * w + x + tx];
            }
            __syncthreads(); // Ensure all threads have loaded the value

            unsigned int val = shared_minmax[tx];
            if (val) {
                for (int k = 0; k < 32 && numPts < maxPts; k++) { // Check numPts condition in the loop condition
                    if (val & 0x1) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads(); // Synchronize before next iteration
        }
    }
}