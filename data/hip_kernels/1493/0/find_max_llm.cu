#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define size 10
#define block 10

__global__ void find_max(int* input, int* result, int n)
{
    __shared__ int sdata[block];
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tx = threadIdx.x;
    
    // Initialize shared memory only when in valid range
    if (i<n)
    {
        sdata[tx] = input[i];
    }
    else
    {
        sdata[tx] = -INT_MAX;
    }
    __syncthreads();
    
    // Reduce using loop unrolling
    for (unsigned int s = blockDim.x >> 1; s > 0; s >>= 1)
    {
        if (tx < s)
        {
            int temp = sdata[tx + s];
            sdata[tx] = max(sdata[tx], temp); // Use max function for clarity
        }
        __syncthreads();
    }

    // Write the result of block to global memory
    if (tx == 0)
    {
        result[blockIdx.x] = sdata[0];
    }
}