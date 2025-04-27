#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyChunks_kernel(void *d_source, int startPos, int2* d_Rin, int rLen, int *d_sum, void *d_dest)
{
    // Calculate global thread ID using block and thread indices
    int globalThreadId = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    int pos = startPos + globalThreadId;

    // Check if thread should perform operation, avoiding out-of-bounds access
    if(pos < rLen)
    {
        // Load value from d_Rin and perform copy operation
        int2 value = d_Rin[pos];
        int offset = value.x;
        int size = value.y;
        int startWritePos = d_sum[pos];

        // Use shared memory for improved performance in copying
        extern __shared__ char sharedSource[];
        char *source = (char*)d_source;
        char *dest = (char*)d_dest;

        // Fill shared memory with chunk data
        for(int i = 0; i < size; i++)
        {
            sharedSource[i] = source[i + offset];
        }
        __syncthreads(); // Synchronize threads before writing to global memory

        // Write back to the global memory from shared memory
        for(int i = 0; i < size; i++)
        {
            dest[i + startWritePos] = sharedSource[i];
        }

        // Update the position for d_Rin
        value.x = startWritePos;
        d_Rin[pos] = value;
    }
}