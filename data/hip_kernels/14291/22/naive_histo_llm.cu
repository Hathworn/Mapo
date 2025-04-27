#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Use shared memory for atomic operation buffering
    extern __shared__ int shared_bins[];
    
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    // Initialize shared memory
    if (threadIdx.x < BIN_COUNT) {
        shared_bins[threadIdx.x] = 0;
    }
    __syncthreads();

    // Use atomicAdd within shared memory
    atomicAdd(&shared_bins[myBin], 1);
    __syncthreads();

    // Transfer results from shared memory to global memory
    if (threadIdx.x < BIN_COUNT) {
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);
    }
}