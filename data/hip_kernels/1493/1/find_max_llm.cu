#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_max(int* input, int* result, int n)
{
    extern __shared__ int sdata[];  // Use dynamic shared memory
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tx = threadIdx.x;
    int x = (i < n) ? input[i] : -INT_MAX;  // Inline conditional operation

    sdata[tx] = x;
    __syncthreads();
    
    for (unsigned int s = blockDim.x >> 1; s > 0; s >>= 1)
    {
        if (tx < s)
        {
            sdata[tx] = max(sdata[tx], sdata[tx + s]);  // Use max() function
        }
        __syncthreads();
    }

    if (threadIdx.x == 0)
    {
        result[blockIdx.x] = sdata[0];
    }
}