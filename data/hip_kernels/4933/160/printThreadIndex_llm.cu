#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void printThreadIndex(int *A, const int nx, const int ny)
{
    // Calculate global thread index
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Early exit if thread is out of bounds
    if (ix >= nx || iy >= ny) return;

    // Compute global linear index
    unsigned int idx = iy * nx + ix;

    // Print information
    printf("thread_id (%d,%d) block_id (%d,%d) coordinate (%d,%d) global index"
           " %2d ival %2d\n", threadIdx.x, threadIdx.y, blockIdx.x, blockIdx.y,
           ix, iy, idx, A[idx]);
}