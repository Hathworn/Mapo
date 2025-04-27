#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimized_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Use shared memory to reduce atomic contention
    extern __shared__ int shared_bins[];
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Initialize shared memory
    if (threadIdx.x < BIN_COUNT) {
        shared_bins[threadIdx.x] = 0;
    }
    __syncthreads();

    // Calculate histogram in shared memory
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;
    atomicAdd(&shared_bins[myBin], 1);
    __syncthreads();

    // Write results back to the global histogram
    if (threadIdx.x < BIN_COUNT) {
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);
    }
}