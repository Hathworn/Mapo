#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Calculate global thread ID
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Fetch data from global memory and calculate bin index
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    
    // Perform atomic operation to update histogram
    atomicAdd(&(d_bins[myBin]), 1);
}