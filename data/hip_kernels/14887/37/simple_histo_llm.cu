#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int tid = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure the thread handles only valid data index
    if (tid < BIN_COUNT)
    {
        int item = d_in[tid];
        int bin = item % BIN_COUNT;

        // Coalesce atomic operations by using a shared memory buffer
        extern __shared__ int shared_bins[];
        atomicAdd(&shared_bins[bin], 1);

        // Synchronize threads to ensure all updates are completed
        __syncthreads();
        
        // Gather results from shared memory to global memory
        atomicAdd(&d_bins[bin], shared_bins[bin]);
    }
}