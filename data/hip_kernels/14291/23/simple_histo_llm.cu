```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Calculate global thread index
    int myId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Fetch data item
    int myItem = d_in[myId];

    // Compute bin index
    int myBin = myItem % BIN_COUNT;

    // Use atomic operation to increment bin count safely across threads
    atomicAdd(&d_bins[myBin], 1);
}