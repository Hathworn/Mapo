#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readGlobalMemoryCoalesced(float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + blockDim.x * blockIdx.x;
    float sum = 0;
    int s = gid;
    #pragma unroll // Loop unrolling for better performance
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll // Unroll inner calculations
        for (int k = 0; k < 16; ++k)
        {
            sum += data[(s + k * 32768) & (size - 1)];
        }
        s = (s + 524288) & (size - 1);
    }
    output[gid] = sum;
}