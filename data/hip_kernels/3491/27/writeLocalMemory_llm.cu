#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeLocalMemory(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int tid = threadIdx.x, localSize = blockDim.x;
    int s = tid;
    __shared__ float lbuf[2048];
    
    // Optimize by unrolling loop with compiler directive
    #pragma unroll
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
    
    int litems = 2048 / localSize; // Move this declaration closer to usage
    
    // Minimize redundant global memory writes by incremental accesses
    int offset = tid;
    for (int j = 0; j < litems; ++j, offset += localSize)
    {
        output[gid] = lbuf[offset & 2047];
    }
}