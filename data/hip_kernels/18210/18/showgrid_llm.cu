#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void showgrid() {
    // Use temporary variables to store thread and block indices
    int tx = threadIdx.x, ty = threadIdx.y, tz = threadIdx.z;
    int bx = blockIdx.x, by = blockIdx.y, bz = blockIdx.z;
    int bdx = blockDim.x, bdy = blockDim.y, bdz = blockDim.z;
    int gdx = gridDim.x, gdy = gridDim.y, gdz = gridDim.z;
    
    // Print using variables to optimize readability
    printf("thread: %d, %d %d\nblock Idxs: %d, %d %d\nblock Dims: %d, %d %d\ngrid: %d, %d %d\n\n\n",
           tx, ty, tz, bx, by, bz, bdx, bdy, bdz, gdx, gdy, gdz);
}