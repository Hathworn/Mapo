```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Use shared memory to reduce global memory contention
    extern __shared__ int shared_bins[];

    // Initialize shared memory
    int tid = threadIdx.x;
    if (tid < BIN_COUNT) {
        shared_bins[tid] = 0;
    }
    __syncthreads();

    // Compute histogram in shared memory
    int myId = tid + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    atomicAdd(&(shared_bins[myBin]), 1);
    __syncthreads();

    // Write shared memory results back to global memory
    if (tid < BIN_COUNT) {
        atomicAdd(&(d_bins[tid]), shared_bins[tid]);
    }
}