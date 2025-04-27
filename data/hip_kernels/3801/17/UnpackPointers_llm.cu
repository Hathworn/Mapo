#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    // Calculate the column index based on thread and block size
    int numPts = 0;
    for (int y = 0; y < h / 32; y++) {
        // Use shared memory for block-wise column access
        __shared__ unsigned int s_val[32];
        
        for (int x = tx; x < w; x += 16) {
            s_val[tx] = minmax[y * w + x]; // Load to shared memory
            
            // Synchronize and process each thread in block
            __syncthreads();

            unsigned int val = s_val[tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if (val & 0x1 && numPts < maxPts) {
                        // Atomic add ensures unique indices
                        int index = atomicAdd(ptrs, 1);
                        ptrs[16 * index + tx] = (y * 32 + k) * w + x; 
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads();
        }
    }
}