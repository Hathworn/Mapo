#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;
    int total_w = h * w; // Calculate total width
    int batchSize = h / (blockDim.x * 2); // Calculate batch size to process more elements
    for (int i=tx; i<total_w; i += blockDim.x * batchSize) {
        int y = i / w;
        int x = i % w;
        unsigned int val = minmax[y*w + x];
        
        // Optimize by unrolling the loop
        if (val) {
            #pragma unroll
            for (int k=0; k<32; k++) {
                if (val & 0x1 && numPts < maxPts) {
                    ptrs[16*numPts + tx] = (y*32 + k)*w + x + tx;
                    numPts++;
                }
                val >>= 1;
            }
        }
    }
}
```
