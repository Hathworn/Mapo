#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeLocalMemory(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int tid = threadIdx.x, localSize = blockDim.x, litems = 2048 / localSize;
    int s = tid;
    __shared__ float lbuf[2048];

    // Unroll the loop to optimize for memory access pattern
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll 16
        for (int k = 0; k < 16; ++k)
        {
            lbuf[(s + k) & 2047] = gid;
        }
        s = (s + 16) & 2047;
    }

    __syncthreads();

    // Efficiently write data back to output
    for (int j = 0; j < litems; ++j)
    {
        output[gid] = lbuf[tid];
    }
}