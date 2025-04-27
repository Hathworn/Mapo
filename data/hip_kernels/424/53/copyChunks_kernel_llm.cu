#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int bid = blockIdx.y * gridDim.x + blockIdx.x; // Improved block index calculation
    const int tid = threadIdx.y * blockDim.x + threadIdx.x; // Improved thread index calculation
    const int resultID = bid * (blockDim.x * blockDim.y) + tid; // Ensure correct global thread ID
    int pos = startPos + resultID;

    if (pos < rLen)
    {
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];
        char *source = reinterpret_cast<char*>(d_source); // Use reinterpret_cast for clarity
        char *dest = reinterpret_cast<char*>(d_dest); // Use reinterpret_cast for clarity

        // Utilize pointer arithmetic instead of loop index
        char *sourcePtr = source + offset;
        char *destPtr = dest + startWritePos;

        // Use a loop unrolling technique for potential performance gain
        #pragma unroll
        for (int i = 0; i < size; ++i)
        {
            destPtr[i] = sourcePtr[i];
        }
        
        value.x = startWritePos;
        d_Rin[pos] = value;
    }
}