#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE (100 * 1024 * 1024)

__global__ void histo_kernel_optimization(unsigned char *buffer, int size, unsigned int *histo)
{
    // Use shared memory to prevent bank conflicts and achieve better performance
    __shared__ unsigned int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Accumulate histogram counts into shared memory
    while (i < size)
    {
        atomicAdd(&temp[buffer[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Use atomic operations to update the global histogram
    atomicAdd(&histo[threadIdx.x], temp[threadIdx.x]);
}