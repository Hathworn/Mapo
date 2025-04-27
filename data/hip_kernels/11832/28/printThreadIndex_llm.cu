#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printThreadIndex(int *A, const int nx, const int ny)
{
    // Precompute the index for improved readability and maintenance.
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Calculate the linear index in the array.
    unsigned int idx = iy * nx + ix;

    // Use a single printf for better performance.
    printf("thread_id (%d,%d) block_id (%d,%d) coordinate (%d,%d) global index %2d ival %2d\n", 
           threadIdx.x, threadIdx.y, blockIdx.x, blockIdx.y, ix, iy, idx, A[idx]);
}