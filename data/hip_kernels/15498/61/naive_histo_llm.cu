#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    extern __shared__ int shared_bins[];  // Declare shared memory for histogram bins

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];
    int myBin = myItem % BIN_COUNT;

    atomicAdd(&shared_bins[myBin], 1);   // Use shared memory to avoid global memory contention

    __syncthreads();  // Ensure all updates to shared memory are done

    if (threadIdx.x < BIN_COUNT) {
        atomicAdd(&d_bins[threadIdx.x], shared_bins[threadIdx.x]);  // Combine results back to global memory
    }
}