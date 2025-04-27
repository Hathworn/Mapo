#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Cache commonly used values
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    // Ensure atomic operation with shared memory optimization
    extern __shared__ int s_bins[];
    atomicAdd(&(s_bins[myBin]), 1);
    __syncthreads(); // Synchronize threads within the block

    // Commit shared results back to global memory ensuring data consistency
    atomicAdd(&(d_bins[myBin]), s_bins[myBin]);
}