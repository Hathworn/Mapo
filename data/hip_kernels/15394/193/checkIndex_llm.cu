#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void checkIndex(void)
{
    // Cache commonly accessed thread and block indices
    int tx = threadIdx.x, ty = threadIdx.y, tz = threadIdx.z;
    int bx = blockIdx.x, by = blockIdx.y, bz = blockIdx.z;
    int bdx = blockDim.x, bdy = blockDim.y, bdz = blockDim.z;
    int gdx = gridDim.x, gdy = gridDim.y, gdz = gridDim.z;

    printf("threadIdx:(%d, %d, %d)\n", tx, ty, tz);
    printf("blockIdx:(%d, %d, %d)\n", bx, by, bz);

    printf("blockDim:(%d, %d, %d)\n", bdx, bdy, bdz);
    printf("gridDim:(%d, %d, %d)\n", gdx, gdy, gdz);
}