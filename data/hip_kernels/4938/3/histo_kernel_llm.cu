#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel(unsigned char *buffer, long size, int *histo)
{
    __shared__ int temp[256];
    // Initialize shared memory for each thread block
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;
    
    // Iterate over the input buffer with a stride equal to the total number of threads
    while (i < size)
    {
        atomicAdd(&temp[buffer[i]], 1); // Use shared memory for local histograms
        i += offset;
    }
    __syncthreads();

    // Accumulate local histograms into the global histogram
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}