#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex(void)
{
    // Cache thread and block indices to avoid redundant calls
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int tz = threadIdx.z;
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int bz = blockIdx.z;
    int bdx = blockDim.x;
    int bdy = blockDim.y;
    int bdz = blockDim.z;
    int gdx = gridDim.x;
    int gdy = gridDim.y;
    int gdz = gridDim.z;

    // Print cached values
    printf("threadIdx:(%d, %d, %d)\n", tx, ty, tz);
    printf("blockIdx:(%d, %d, %d)\n", bx, by, bz);
    printf("blockDim:(%d, %d, %d)\n", bdx, bdy, bdz);
    printf("gridDim:(%d, %d, %d)\n", gdx, gdy, gdz);
}