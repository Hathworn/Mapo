#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT) {
    // Calculate global thread index
    int myId = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure within bounds before accessing memory
    if (myId < BIN_COUNT) { 
        int myItem = d_in[myId];
        int myBin = myItem % BIN_COUNT;
        // Use atomicAdd for thread-safe increments
        atomicAdd(&(d_bins[myBin]), 1);
    }
}