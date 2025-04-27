#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure myId does not exceed data bounds
    if (myId >= BIN_COUNT) return;

    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    // Use atomic function to ensure thread safety when updating shared data
    atomicAdd(&(d_bins[myBin]), 1);
}