#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    // Index calculations for block and thread
    const int bx = blockIdx.x;
    const int tx = threadIdx.x;
    const int tid = tx + blockIdx.y * blockDim.x;
    const int resultID = bx * gridDim.y * blockDim.x + tid;
    int pos = startPos + resultID;

    // Check bounds before proceeding
    if (pos < rLen)
    {
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];
        
        // Use pointer arithmetic for memory copy
        char *source = (char*)d_source + offset;
        char *dest = (char*)d_dest + startWritePos;
        
        // Efficient memory copy
        for (int i = 0; i < size; i++)
        {
            dest[i] = source[i];
        }
        
        // Update start position
        value.x = startWritePos;
        d_Rin[pos] = value;
    }
}