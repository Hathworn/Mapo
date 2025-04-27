#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure threadId does not exceed input size
    if (myId < BIN_COUNT) {
        int myItem = d_in[myId];
        int myBin = myItem % BIN_COUNT;

        // Use shared memory for bins to reduce global memory access
        extern __shared__ int shared_bins[];

        atomicAdd(&(shared_bins[myBin]), 1);
        __syncthreads();

        // Only one block reduces shared results to global memory
        atomicAdd(&(d_bins[myBin]), shared_bins[myBin]);
    }
}