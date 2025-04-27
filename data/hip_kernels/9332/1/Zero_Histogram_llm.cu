#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Zero_Histogram(int* rawBinSums, unsigned int simHeight, unsigned int simWidth)
{
    // Calculate global index
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;
    int quadIdx = x + y * simWidth;

    // Check bounds before accessing the array
    if (quadIdx < simHeight * simWidth)
    {
        rawBinSums[quadIdx] = 0; // Set the element to zero
    }
    else
    {
        printf("ERROR: Out of rawBinSums[] bounds, calling: %d, max: %d\n", quadIdx, simHeight * simWidth);
    }
}