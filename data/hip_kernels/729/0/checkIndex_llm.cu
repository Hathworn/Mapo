#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex(void) {
    // Optimize by storing frequently accessed values in local variables
    int tx = threadIdx.x, ty = threadIdx.y, tz = threadIdx.z;
    int bx = blockIdx.x, by = blockIdx.y, bz = blockIdx.z;
    int bdx = blockDim.x, bdy = blockDim.y, bdz = blockDim.z;
    int gdx = gridDim.x, gdy = gridDim.y, gdz = gridDim.z;

    printf("threadIdx: (%d,%d,%d) blockIdx: (%d, %d, %d) blockDim: (%d, %d, %d) gridDim: (%d, %d, %d)\n",
           tx, ty, tz, bx, by, bz, bdx, bdy, bdz, gdx, gdy, gdz);
}