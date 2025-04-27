#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel (unsigned char *buffer, long size, int *histo)
{
    __shared__ int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    while (i + offset * 3 < size)
    {
        atomicAdd(&temp[buffer[i]], 1);
        atomicAdd(&temp[buffer[i + offset]], 1);
        atomicAdd(&temp[buffer[i + offset * 2]], 1);
        atomicAdd(&temp[buffer[i + offset * 3]], 1);
        i += offset * 4;
    }

    while (i < size)
    {
        atomicAdd(&temp[buffer[i]], 1);
        i += offset;
    }
    __syncthreads();

    // Ensure coalesced memory access
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
}