#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int gridStride = gridDim.x * blockDim.x;
    int numPts = 0;

    // Process grid-stride loop to allow for larger problem sizes
    for (int tid = blockIdx.x * blockDim.x + tx; tid < (h/32) * (w/16); tid += gridStride) {
        int y = tid / (w/16);
        int x = (tid % (w/16)) * 16;

        unsigned int val = minmax[y * w + x + tx];
        
        if (val) {
            int localNumPts = 0;

            #pragma unroll // Suggest the use of loop unrolling for known small iteration counts
            for (int k = 0; k < 32; k++) {
                if ((val & 0x1) && (localNumPts + numPts < maxPts)) {
                    ptrs[(numPts + localNumPts) * 16 + tx] = (y * 32 + k) * w + x + tx;
                    localNumPts++;
                }
                val >>= 1;
            }
            
            numPts += localNumPts; // Update numPts outside of the loop
        }
    }
}