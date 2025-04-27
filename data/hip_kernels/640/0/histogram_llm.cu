```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram(unsigned int* in, unsigned int* hist, int n, unsigned int nBins, unsigned int mask, unsigned int current_bits)
{
    extern __shared__ unsigned int s_local_hist[];

    // Initialize shared memory with zeros
    for (int j = threadIdx.x; j < nBins; j += blockDim.x)
    {
        s_local_hist[j] = 0;
    }

    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        unsigned int bin = (in[i] >> current_bits) & mask;
        // Atomic addition in shared memory
        atomicAdd(&s_local_hist[bin], 1);
    }
    __syncthreads();

    // Write shared memory histogram to global memory
    for (int bin = threadIdx.x; bin < nBins; bin += blockDim.x)
    {
        hist[bin * gridDim.x + blockIdx.x] = s_local_hist[bin];
    }
}