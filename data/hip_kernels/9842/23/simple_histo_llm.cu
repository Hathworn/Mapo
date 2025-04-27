#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Calculate unique index for the current thread
    int myId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficiently load data from global input array
    int myItem = d_in[myId];
    
    // Determine appropriate bin for this thread's element
    int myBin = myItem % BIN_COUNT;
    
    // Use atomic operation to safely update the bin count
    atomicAdd(&d_bins[myBin], 1);
}