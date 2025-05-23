#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histo_kernel ( unsigned char *buffer, long size, int *histo )
{
    __shared__ int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;
    while (i < size)
    {
        atomicAdd(&temp[buffer[i]], 1);
        i += offset;
    }
    __syncthreads();

    // Use a loop to handle all shared memory indices to optimize atomicAdd calls
    for (int j = threadIdx.x; j < 256; j += blockDim.x)
    {
        atomicAdd(&(histo[j]), temp[j]);
    }
}