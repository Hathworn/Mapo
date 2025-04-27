#include "hip/hip_runtime.h"
#include "includes.h"

// Use atomic operation to avoid race conditions
__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    // Atomic addition for thread safety
    atomicAdd(&d_bins[myBin], 1);
}