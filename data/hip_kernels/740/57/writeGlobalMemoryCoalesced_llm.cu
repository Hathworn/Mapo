#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryCoalesced(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int stride = 32768;  // Use a constant stride
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll
        for (int i = 0; i < 16; ++i) // Unroll loop for memory access
        {
            output[(gid + i * stride) & (size - 1)] = gid;
        }
        gid = (gid + 16 * stride) & (size - 1); // Update gid for next iteration
    }
}