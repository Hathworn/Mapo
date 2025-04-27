#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeHistogram(unsigned int *buffer, int size, unsigned int *histo)
{
    __shared__ unsigned int temp[1024];

    // Initialize shared memory
    temp[threadIdx.x] = 0;
    temp[threadIdx.x + 256] = 0;
    temp[threadIdx.x + 512] = 0;
    temp[threadIdx.x + 768] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;
    // Main loop to accumulate values in shared memory
    while (i < size)
    {
        atomicAdd(&temp[buffer[i] & 1023], 1); // Index wrap to reduce bank conflicts
        i += offset;
    }
    __syncthreads();

    // Accumulate shared memory results into global histogram
    atomicAdd(&(histo[threadIdx.x]), temp[threadIdx.x]);
    atomicAdd(&(histo[threadIdx.x + 256]), temp[threadIdx.x + 256]);
    atomicAdd(&(histo[threadIdx.x + 512]), temp[threadIdx.x + 512]);
    atomicAdd(&(histo[threadIdx.x + 768]), temp[threadIdx.x + 768]);
}