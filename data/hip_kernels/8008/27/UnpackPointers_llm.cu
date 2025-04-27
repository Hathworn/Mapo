#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Obtain thread ID
    const int tx = threadIdx.x;

    // Shared memory for minmax values per thread block
    __shared__ unsigned int sh_minmax[32 * (16 / 32)];

    // Block-level shared numPts for atomic updates
    __shared__ int sh_numPts;
    if (tx == 0) sh_numPts = 0;
    __syncthreads();

    // Iterate over rows in steps of 32
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {

            // Load minmax values into shared memory
            if (x+tx < w) {
                sh_minmax[tx] = minmax[y * w + x + tx];
            }
            else {
                sh_minmax[tx] = 0;
            }
            __syncthreads();

            unsigned int val = sh_minmax[tx];

            if (val) {
                // Check each bit in val
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1) {
                        // Use atomic add to safely increment global numPts
                        int index = atomicAdd(&sh_numPts, 1);
                        if (index < maxPts) {
                            ptrs[16 * index + tx] = (y * 32 + k) * w + x + tx;
                        }
                    }
                    val >>= 1;
                }
            }
            __syncthreads();
        }
    }
}