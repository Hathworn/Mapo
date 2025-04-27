#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int numThread = blockDim.x * blockDim.y; // Using both blockDim.x and blockDim.y
    const int resultID = bid * numThread + tid; // Calculating global thread index
    int pos = startPos + resultID;

    if (pos < rLen)
    {
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];
        char* source = (char*)d_source + offset; // Adjust pointer directly
        char* dest = (char*)d_dest + startWritePos; // Adjust pointer directly

        for (int i = 0; i < size; i++)
        {
            dest[i] = source[i]; // Simplified copying logic
        }
        value.x = startWritePos;
        d_Rin[pos] = value; // Write back the updated start write position
    }
}