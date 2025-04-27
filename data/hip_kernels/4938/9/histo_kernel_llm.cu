#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_kernel ( unsigned char *buffer, long size, int *histo )
{
    // Use shared memory for temporary histogram accumulation
    __shared__ int temp[256];
    temp[threadIdx.x] = 0;
    __syncthreads();

    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;
    // Unroll loop to improve memory access efficiency
    while (i < size)
    {
        atomicAdd( &temp[buffer[i]], 1);
        i += offset;
    }
    __syncthreads();

    // Single atomic add to global histogram
    atomicAdd( &(histo[threadIdx.x]), temp[threadIdx.x] );
}