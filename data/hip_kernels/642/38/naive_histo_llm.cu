#include "hip/hip_runtime.h"
#include "includes.h"

// Use atomic operation to prevent race conditions
__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Only proceed if myId is within bounds
    if (myId < BIN_COUNT) {
        int myItem = d_in[myId];
        int myBin = myItem % BIN_COUNT;

        // Atomically increment the bin to avoid conflicts
        atomicAdd(&d_bins[myBin], 1);
    }
}