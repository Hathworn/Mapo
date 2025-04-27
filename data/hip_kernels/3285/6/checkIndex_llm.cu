```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkIndex() {
    // Cache frequently accessed values in registers to reduce latency
    int bx = blockIdx.x; 
    int by = blockIdx.y; 
    int bz = blockIdx.z;
    int tx = threadIdx.x; 
    int ty = threadIdx.y; 
    int tz = threadIdx.z;
    int bdx = blockDim.x; 
    int bdy = blockDim.y; 
    int bdz = blockDim.z;
    int gdx = gridDim.x; 
    int gdy = gridDim.y; 
    int gdz = gridDim.z;

    printf("blockIdx:(%d, %d, %d) threadIdx:(%d, %d, %d) blockDim:(%d, %d, %d) gridDim:(%d, %d, %d)\n",
           bx, by, bz, tx, ty, tz, bdx, bdy, bdz, gdx, gdy, gdz);
}