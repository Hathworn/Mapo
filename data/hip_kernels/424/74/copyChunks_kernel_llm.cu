#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int tid = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation

    if(tid < rLen) // Use single thread index for bounds check
    {
        int2 value = d_Rin[tid];  // Access only the required index
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[tid]; 
        char *source = (char*)d_source + offset; // Pre-calculate source pointer
        char *dest = (char*)d_dest + startWritePos; // Pre-calculate destination pointer

        for(int i = 0; i < size; ++i)
        {
            dest[i] = source[i]; // Use pre-calculated pointers in copy operation
        }

        value.x = startWritePos;
        d_Rin[tid] = value; // Write back only the modified value
    }
}