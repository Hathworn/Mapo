#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UnpackPointers(int *minmax, int *ptrs, int w, int h, int maxPts)
{
    const int tx = threadIdx.x;
    const int strideX = blockDim.x;
    const int strideY = gridDim.x; // Optimization: Use grids and blocks 

    // Optimization: Determine global thread index
    int globalX = blockIdx.x * strideX + tx;
    int globalY = blockIdx.y * strideY;
    int numPts = 0;

    for (int y = globalY; y < h; y += strideY * 32) // Optimization: Adjust loop range
    {
        for (int x = globalX; x < w; x += strideX) // Optimization: Adjust loop range
        {
            unsigned int val = minmax[y * w + x];
            
            if (val)
            {
                for (int k = 0; k < 32; k++)
                {
                    if (val & 0x1 && numPts < maxPts)
                    {
                        ptrs[16 * numPts + tx] = (y + k) * w + x;
                        numPts++;
                    }
                    val >>= 1;
                }
            }
        }
    }
}