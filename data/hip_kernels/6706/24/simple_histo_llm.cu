#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Compute global ID
    int myId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Read item only if the thread is within data bounds
    if(myId < BIN_COUNT) {
        int myItem = d_in[myId];
        
        // Compute bin only if the index is valid
        int myBin = myItem % BIN_COUNT;
        
        // Use atomic operation safely for valid bins
        atomicAdd(&(d_bins[myBin]), 1);
    }
}