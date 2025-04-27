#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    
    // Reduction to avoid race conditions
    __shared__ int local_bins[1024]; // Adjust the size according to BIN_COUNT if needed
    local_bins[threadIdx.x] = 0;
    __syncthreads();
    
    atomicAdd(&local_bins[myBin], 1); 
    __syncthreads();
    
    // Transfer back to global memory
    atomicAdd(&d_bins[myBin], local_bins[threadIdx.x]);
}