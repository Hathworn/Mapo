#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Get unique thread identifier
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Load input value
    int myItem = d_in[myId];
    
    // Compute bin index
    int myBin = myItem % BIN_COUNT;

    // Perform atomic addition
    atomicAdd(&(d_bins[myBin]), 1);
}