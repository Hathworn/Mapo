#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    const int tid = threadIdx.x + threadIdx.y * blockDim.x;
    const int bid = blockIdx.x + blockIdx.y * gridDim.x;
    const int numThread = blockDim.x * blockDim.y; // Fix: Include both x and y dimensions for numThread
    const int resultID = bid * numThread + tid;
    int pos = startPos + resultID;

    if (pos < rLen) {
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];
        char *source = (char *)d_source + offset; // Optimize: Offset source pointer directly
        char *dest = (char *)d_dest + startWritePos; // Optimize: Offset dest pointer directly

        #pragma unroll 4 // Optimize: Unroll loop for potential performance enhancement
        for (int i = 0; i < size; i++) {
            dest[i] = source[i];
        }

        value.x = startWritePos;
        d_Rin[pos] = value;
    }
}