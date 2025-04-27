#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    __shared__ int shared_bins[1024]; // Adjust size if necessary

    // Initialize shared memory
    if (threadIdx.x < BIN_COUNT) {
        shared_bins[threadIdx.x] = 0;
    }
    __syncthreads();

    // Calculate local histogram
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    atomicAdd(&shared_bins[myBin], 1);
    __syncthreads();

    // Accumulate to global memory
    if (threadIdx.x < BIN_COUNT) {
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);
    }
}