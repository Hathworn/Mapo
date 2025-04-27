#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE (100 * 1024 * 1024)

__global__ void histo_kernel(unsigned char *buffer, int size, unsigned int *histo)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory for histogram to reduce global memory accesses
    __shared__ unsigned int sharedHisto[256];
    if (threadIdx.x < 256)
    {
        sharedHisto[threadIdx.x] = 0;
    }
    __syncthreads();

    while (i < size)
    {
        atomicAdd(&sharedHisto[buffer[i]], 1); // Accumulate count in shared memory
        i += stride;
    }
    __syncthreads();

    // Aggregate shared memory histogram into global memory
    if (threadIdx.x < 256)
    {
        atomicAdd(&histo[threadIdx.x], sharedHisto[threadIdx.x]);
    }
}