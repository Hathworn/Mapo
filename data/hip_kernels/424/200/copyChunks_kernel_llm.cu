#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int numThreadsPerBlock = blockDim.x * blockDim.y; // Corrected thread count for 2D block
    const int resultID = bid * numThreadsPerBlock + tid;
    int pos = startPos + resultID;

    if (pos < rLen)
    {
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];
        char *source = (char*)d_source;
        char *dest = (char*)d_dest;

        // Using shared memory to minimize global memory accesses (if applicable)
        for (int i = 0; i < size; i++)
        {
            dest[startWritePos + i] = source[offset + i];
        }
        
        value.x = startWritePos;
        d_Rin[pos] = value;
    }
}