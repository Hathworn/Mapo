#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int blockStart = tx + blockIdx.x * blockDim.x;
    const int stride = blockDim.x * gridDim.x; // Calculate stride for processing

    int numPts = 0;

    // Loop with stride for better utilization of threads
    for (int pos = blockStart; pos < h / 32 * w; pos += stride) {
        int y = pos / w;
        int x = pos % w;

        if (x + tx < w) {
            unsigned int val = minmax[y * w + x + tx];
            if (val) {
                for (int k = 0; k < 32 && numPts < maxPts; k++) {
                    if (val & 0x1) {
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}