#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Calculate thread index for input element
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Use shared memory for bin increments to reduce global memory updates
    extern __shared__ int shared_bins[];
    int myBin = d_in[myId] % BIN_COUNT;

    // Initialize shared memory bins
    atomicAdd(&shared_bins[threadIdx.x], 0);
    __syncthreads();

    // Perform atomic addition on shared memory
    atomicAdd(&shared_bins[myBin], 1);
    __syncthreads();
    
    // Transfer results from shared to global memory
    if (threadIdx.x < BIN_COUNT) {
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);
    }
}