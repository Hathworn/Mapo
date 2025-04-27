#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naive_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    // Shared memory for storing histogram for each block
    extern __shared__ int shared_bins[];
    int thread_id = threadIdx.x;
    int block_start_index = thread_id + blockDim.x * blockIdx.x;

    // Initialize shared histogram
    if (thread_id < BIN_COUNT)
    {
        shared_bins[thread_id] = 0;
    }
    __syncthreads();

    // Calculate histogram index and update shared histogram
    int item = d_in[block_start_index];
    int bin = item % BIN_COUNT;

    atomicAdd(&shared_bins[bin], 1);
    __syncthreads();

    // Merge shared histogram into global histogram
    if (thread_id < BIN_COUNT)
    {
        atomicAdd(&d_bins[thread_id], shared_bins[thread_id]);
    }
}