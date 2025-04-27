#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_histogram(unsigned char *data, unsigned int *histogram)
{
    extern __shared__ unsigned int local_hist[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Initialize shared memory for local histogram
    local_hist[tid] = 0;
    __syncthreads(); // Ensure all threads have initialized

    // Populate local histogram
    while (i < N)
    {
        atomicAdd(&local_hist[data[i]], 1);
        i += blockDim.x * gridDim.x;
    }
    __syncthreads(); // Ensure local histogram is complete

    // Accumulate local histogram into global histogram
    atomicAdd(&histogram[tid], local_hist[tid]);
}