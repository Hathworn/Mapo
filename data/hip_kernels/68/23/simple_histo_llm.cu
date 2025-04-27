#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Avoid accessing out-of-bounds memory
    if (myId >= BIN_COUNT) return;

    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    // Minimize atomic operations by using a shared memory buffer
    extern __shared__ int shared_bins[];

    // Initialize shared memory to zero
    if (threadIdx.x < BIN_COUNT) {
        shared_bins[threadIdx.x] = 0;
    }
    __syncthreads();

    // Atomic operation on shared memory
    atomicAdd(&(shared_bins[myBin]), 1);
    __syncthreads();

    // Transfer results from shared memory to global memory
    if (threadIdx.x < BIN_COUNT) {
        atomicAdd(&(d_bins[threadIdx.x]), shared_bins[threadIdx.x]);
    }
}