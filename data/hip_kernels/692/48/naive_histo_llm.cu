#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Use shared memory to accumulate histogram for current block
    extern __shared__ int shared_bins[];
    
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    
    // Initialize shared memory for the current block
    if (threadIdx.x < BIN_COUNT) 
    {
        shared_bins[threadIdx.x] = 0;
    }
    __syncthreads();
    
    // Accumulate histogram in shared memory
    atomicAdd(&shared_bins[myBin], 1);
    
    __syncthreads();
    
    // Merge results back to global memory
    if (threadIdx.x < BIN_COUNT) 
    {
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);
    }
}