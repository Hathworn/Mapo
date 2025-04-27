#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Store thread and block indices to shared memory to reduce global memory accesses
    __shared__ int shared_bins[1024]; 
    int myId = threadIdx.x + blockDim.x * blockIdx.x;

    // Initialize shared bins to zero in parallel
    if(threadIdx.x < BIN_COUNT) {
        shared_bins[threadIdx.x] = 0;
    }
    __syncthreads();

    // Find bin index using modulus operation
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    
    // Atomic addition to avoid race condition
    atomicAdd(&(shared_bins[myBin]), 1);
    __syncthreads();

    // Write back to global memory
    if(threadIdx.x < BIN_COUNT) {
        atomicAdd(&(d_bins[threadIdx.x]), shared_bins[threadIdx.x]);
    }
}