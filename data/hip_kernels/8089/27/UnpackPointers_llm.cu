#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    // Use shared memory for efficient access
    extern __shared__ int sharedMinmax[];

    const int tx = threadIdx.x;
    const int bx = blockIdx.x;
    const int stride = blockDim.x;

    int numPts = 0;

    for (int y = bx; y < h / 32; y += gridDim.x) {
        for (int x = 0; x < w; x += stride) {
            // Load data into shared memory for coalesced access
            sharedMinmax[tx] = (x + tx < w) ? minmax[y * w + x + tx] : 0;
            __syncthreads();

            unsigned int val = sharedMinmax[tx];
            if (val) {
                for (int k = 0; k < 32; k++) {
                    if ((val & 0x1) && (numPts < maxPts)) {
                        // Write result to global memory with coalesced access  
                        ptrs[16 * numPts + tx] = (y * 32 + k) * w + x + tx;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
            __syncthreads();
        }
    }
}