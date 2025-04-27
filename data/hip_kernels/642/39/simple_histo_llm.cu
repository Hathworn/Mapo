#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    
    // Reduce contention by using a local variable to accumulate
    __shared__ int localBins[1024];  // Assuming blockDim.x <= 1024
    if (threadIdx.x < BIN_COUNT) {
        // Initialize shared memory bins to zero
        localBins[threadIdx.x] = 0;
    }
    __syncthreads();
    
    atomicAdd(&(localBins[myBin]), 1);
    __syncthreads();
    
    if (threadIdx.x < BIN_COUNT) {
        // Aggregate localBins to global d_bins
        atomicAdd(&(d_bins[threadIdx.x]), localBins[threadIdx.x]);
    }
}