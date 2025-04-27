#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readGlobalMemoryUnit(float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    float sum = 0;
    int s = gid * 512;
    // Use loop unrolling and burst memory access
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll 16
        for (int offset = 0; offset < 16; ++offset)
        {
            sum += data[(s + offset) & (size - 1)];
        }
        s = (s + 16) & (size - 1);
    }
    output[gid] = sum;
}