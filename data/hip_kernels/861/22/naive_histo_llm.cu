#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    extern __shared__ int s_bins[]; // Use shared memory for faster access
    int tid = threadIdx.x;
    int myId = tid + blockDim.x * blockIdx.x;
    
    if (tid < BIN_COUNT) {
        s_bins[tid] = 0; // Initialize shared memory bins
    }
    __syncthreads();

    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    atomicAdd(&s_bins[myBin], 1); // Use atomic operations to avoid race conditions
    __syncthreads();

    if (tid < BIN_COUNT) {
        atomicAdd(&d_bins[tid], s_bins[tid]); // Write results back to global memory
    }
}