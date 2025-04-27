#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    int numPts = 0;

    // Coalesce memory accesses and improving iteration efficiency
    for (int y = 0; y < h; y += 32)
    {
        for (int x = 0; x < w; x += 16)
        {
            unsigned int val = minmax[((y / 32) * w) + x + tx];
            int base = y * w + x + tx;
            if (val)
            {
                // Loop unrolling to reduce overhead
                for (int k = 0; k < 32; k += 4)
                {
                    #pragma unroll
                    for (int i = 0; i < 4; ++i)
                    {
                        if ((val & 0x1) && (numPts < maxPts))
                        {
                            ptrs[16 * numPts + tx] = base + (k + i) * w;
                            numPts++;
                        }
                        val >>= 1;
                    }
                }
            }
        }
    }
}