#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void printThreadIndex(int *A, const int nx, const int ny) {
    // Calculate global thread index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int idx = iy * nx + ix;

    // Check if the thread index is within bounds
    if (ix < nx && iy < ny) {
        printf("thread_id (%d, %d) block_id (%d, %d) coordinate (%d, %d) global index %2d ival %2d\n", 
               threadIdx.x, threadIdx.y, blockIdx.x, blockIdx.y, ix, iy, idx, A[idx]);
    }
}