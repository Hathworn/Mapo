```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeLocalMemory(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int tid = threadIdx.x;
    int localSize = blockDim.x;
    int litems = 2048 / localSize;
    int s = tid;
    __shared__ float lbuf[2048];
    
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll 16  // Unroll loop to reduce loop overhead
        for (int k = 0; k < 16; ++k)
        {
            lbuf[(s + k) & 2047] = gid;  // Loop to minimize repetitive code
        }
        s = (s + 16) & 2047;
    }
    
    __syncthreads();

    #pragma unroll // Unroll loop to optimize performance
    for (int j = 0; j < litems; ++j)
    {
        output[gid] = lbuf[tid];
    }
}