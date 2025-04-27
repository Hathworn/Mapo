#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int tid = threadIdx.y * blockDim.x + threadIdx.x;  // Flatten thread index
    const int bid = blockIdx.y * gridDim.x + blockIdx.x;     // Flatten block index
    const int numThread = blockDim.x * blockDim.y;           // Calculate total threads in block
    const int resultID = bid * numThread + tid;              // Calculate global index
    int pos = startPos + resultID;

    if (pos < rLen)
    {
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];
        char *source = static_cast<char*>(d_source);
        char *dest = static_cast<char*>(d_dest);

        // Optimize memory copy using memcpy
        memcpy(dest + startWritePos, source + offset, size * sizeof(char));

        value.x = startWritePos;
        d_Rin[pos] = value;
    }
}