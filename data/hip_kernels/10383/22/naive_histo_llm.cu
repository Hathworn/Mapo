```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    extern __shared__ int shared_bins[]; // Use shared memory for bin counting
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    if (threadIdx.x < BIN_COUNT) // Initialize shared memory bins
        shared_bins[threadIdx.x] = 0;
    __syncthreads();

    atomicAdd(&shared_bins[myBin], 1); // Use atomicAdd on shared memory
    __syncthreads();

    if (threadIdx.x < BIN_COUNT) // Increment the global bins
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);
}