#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex(void)
{
    // Store thread and block indices in shared memory for efficiency
    int thIdxX = threadIdx.x;
    int thIdxY = threadIdx.y;
    int thIdxZ = threadIdx.z;

    // Store block dimensions in shared memory for efficiency
    int blIdxX = blockIdx.x;
    int blIdxY = blockIdx.y;
    int blIdxZ = blockIdx.z;

    // Store block dimensions and grid dimensions
    int blDimX = blockDim.x;
    int blDimY = blockDim.y;
    int blDimZ = blockDim.z;

    int grDimX = gridDim.x;
    int grDimY = gridDim.y;
    int grDimZ = gridDim.z;

    // Use stored values for printing
    printf("threadIdx:(%d, %d, %d)\n", thIdxX, thIdxY, thIdxZ);
    printf("blockIdx:(%d, %d, %d)\n", blIdxX, blIdxY, blIdxZ);
    printf("blockDim:(%d, %d, %d)\n", blDimX, blDimY, blDimZ);
    printf("gridDim:(%d, %d, %d)\n", grDimX, grDimY, grDimZ);
}