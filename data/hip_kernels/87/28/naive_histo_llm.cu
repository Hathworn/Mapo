#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Calculate global thread ID
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Shared memory for bins to reduce global memory contention
    extern __shared__ int shared_bins[];

    // Initialize shared memory bins
    for (int i = threadIdx.x; i < BIN_COUNT; i += blockDim.x) {
        shared_bins[i] = 0;
    }
    __syncthreads();

    // Calculate bin for the current item
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    // Atomic addition to update the shared bin
    atomicAdd(&shared_bins[myBin], 1);
    __syncthreads();

    // Transfer shared memory bins to global memory
    for (int i = threadIdx.x; i < BIN_COUNT; i += blockDim.x) {
        atomicAdd(&d_bins[i], shared_bins[i]);
    }
}