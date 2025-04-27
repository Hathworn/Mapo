#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    if (myId < BIN_COUNT) // Ensure within bounds
    {
        int myBin = myItem % BIN_COUNT;
        atomicAdd(&(d_bins[myBin]), 1);
    }
}