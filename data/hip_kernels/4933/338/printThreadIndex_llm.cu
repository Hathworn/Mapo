#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void printThreadIndex(int *A, const int nx, const int ny)
{
    // Calculate unique thread index using block and thread indices
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure the thread is within matrix bounds
    if (ix < nx && iy < ny)
    {
        unsigned int idx = iy * nx + ix;
        
        // Print thread information and array value
        printf("thread_id: (%d, %d), block_id: (%d, %d), coordinate: (%d, %d) global index %2d ival %2d\n",
               threadIdx.x, threadIdx.y, blockIdx.x, blockIdx.y, ix, iy, idx, A[idx]);
    }
}