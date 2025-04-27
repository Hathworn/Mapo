#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printThreadIndex(int *A, const int nx, const int ny)
{
    // Calculate thread's unique x and y coordinates in the grid
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate the global index
    unsigned int idx = iy * nx + ix;

    // Ensure threads work within bounds
    if (ix < nx && iy < ny) {
        printf("thread_id (%d,%d) block_id (%d,%d) coordinate (%d,%d) global index"
        " %2d ival %2d\n", threadIdx.x, threadIdx.y, blockIdx.x, blockIdx.y,
        ix, iy, idx, A[idx]);
    }
}