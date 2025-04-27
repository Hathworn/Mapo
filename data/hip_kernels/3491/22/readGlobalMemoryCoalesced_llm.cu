#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readGlobalMemoryCoalesced(float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    float sum = 0;
    int s = gid;

    #pragma unroll // Enable loop unrolling for potential performance gain
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll // Unroll the accumulation loop
        for (int i = 0; i < 16; ++i)
        {
            sum += data[(s + i * 32768) & (size - 1)];
        }
        s = (s + 524288) & (size - 1); // Use a consistent update for 's'
    }
    output[gid] = sum;
}