#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread ID directly

    if (tid < rLen)  // Only execute if within bounds
    {
        int2 value = d_Rin[tid];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[tid];
        char *source = (char*)d_source + offset;  // Pointer arithmetic to avoid recalculating inside loop
        char *dest = (char*)d_dest + startWritePos;

        for (int i = 0; i < size; i++)  // Simplify the loop 
        {
            dest[i] = source[i];
        }
        
        d_Rin[tid].x = startWritePos;  // Store updated start position
    }
}