```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PopulateBins(int* rawBinSums, float2* rawRingPoints, float xRange, float yRange, int mode, int numPoints, unsigned int simHeight, unsigned int simWidth)
{
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx >= numPoints) return; // Ensure the thread idx is within bounds

    // Directly compute bin indices instead of using a loop
    int xBin = __float2int_rd((rawRingPoints[idx].x + xRange / 2.0f) * simWidth / xRange);
    int yBin = __float2int_rd((rawRingPoints[idx].y + yRange / 2.0f) * simHeight / yRange);

    // Clamp xBin and yBin to valid range
    xBin = max(0, min(simWidth - 1, xBin));
    yBin = max(0, min(simHeight - 1, yBin));

    if (idx == 10)
    {
        printf("Idx 10 reads X: %f, Y: %f\n", rawRingPoints[idx].x, rawRingPoints[idx].y);
        printf("Idx 10 trying to add to bin: %d, %d, %d\n", xBin, yBin, xBin + yBin * simWidth);
    }

    atomicAdd(&rawBinSums[xBin + yBin * simWidth], 1);
}