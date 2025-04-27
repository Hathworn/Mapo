#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Calculate the global index
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Load into register
    int myItem = d_in[myId]; 

    // Calculate bin index
    int myBin = myItem % BIN_COUNT;

    // Atomic increment for bin count
    atomicAdd(&d_bins[myBin], 1);
}