#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    if (myId < BIN_COUNT)  // Ensure myId is within bounds
    {
        int myItem = d_in[myId];
        int myBin = myItem % BIN_COUNT;
        atomicAdd(&(d_bins[myBin]), 1);  // Use atomic operation for safe bin increment
    }
}