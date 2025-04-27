#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Load common variables outside the loops for efficiency
    const int tx = threadIdx.x;
    int numPts = 0;
    const int stride = w / 32;
    // Use shared memory to reduce global memory access
    __shared__ unsigned int shared_minmax[32];

    for (int y = 0; y < h / 32; y++) {
        for (int x = 0; x < w; x += 32) {
            // Load data to shared memory to reduce global memory access
            shared_minmax[tx] = minmax[y * stride + x + tx];
            __syncthreads();

            unsigned int val = shared_minmax[tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        ptrs[32 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads();
        }
    }
}