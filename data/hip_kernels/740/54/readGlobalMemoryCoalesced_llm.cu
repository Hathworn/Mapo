#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readGlobalMemoryCoalesced(float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x), j = 0;
    float sum = 0;
    int s = gid;

    #pragma unroll // Unroll loop for better performance
    for (j = 0; j < repeat; ++j)
    {
        #pragma unroll // Unroll accesses for better coalescing and performance
        for (int i = 0; i < 16; ++i)
        {
            sum += data[(s + i * 32768) & (size - 1)];
        }
        s = (s + 524288) & (size - 1);
    }

    output[gid] = sum;
}