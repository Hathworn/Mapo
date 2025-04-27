#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 16) {
            // Load minmax value into shared memory for efficient access
            __shared__ unsigned int shared_val[32];
            shared_val[tx] = minmax[y * w + x + tx];
            __syncthreads();

            unsigned int val = shared_val[tx];
            if (val) {
                // Unroll loop to reduce branch divergence and improve throughput
                #pragma unroll
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads(); // Ensure all threads complete this block before continuing
        }
    }
}