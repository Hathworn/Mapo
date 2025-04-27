#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Check bounds to prevent out-of-bounds memory access
    if (myId < BIN_COUNT) 
    {
        int myItem = d_in[myId];
        int myBin = myItem % BIN_COUNT;
        
        // Use atomic add to avoid race conditions
        atomicAdd(&(d_bins[myBin]), 1);
    }
}