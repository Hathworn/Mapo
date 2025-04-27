#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernal(char *buffer, long size, int *histo)
{
    __shared__ int temp[256];
    // Initialize shared memory with 0
    if (threadIdx.x < 256) {
        temp[threadIdx.x] = 0;
    }
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;
    while (i < size)
    {
        atomicAdd(&temp[(int)buffer[i]], 1); // Cast buffer element to int
        i += offset;
    }
    __syncthreads();

    // Accumulate results from shared memory to global memory
    if (threadIdx.x < 256) {
        atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
    }
}