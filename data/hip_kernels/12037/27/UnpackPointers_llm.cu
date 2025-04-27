#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int bx = blockIdx.x;  // Use blockIdx.x for parallelization
    const int numThreads = blockDim.x * gridDim.x;
    int numPts = 0;

    // Loop over y and x in a parallelized manner
    for (int idx = bx * blockDim.x + tx; idx < (h/32)*w; idx += numThreads) {
        int y = idx / w;
        int x = idx % w;

        unsigned int val = minmax[y*w + x];
        if (val) {
            for (int k = 0; k < 32 && numPts < maxPts; k++) {
                if (val & 0x1) {
                    ptrs[16*numPts + tx] = (y*32 + k) * w + x;
                    numPts++;
                }
                val >>= 1;
            }
        }
    }
}