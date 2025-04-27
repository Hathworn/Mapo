#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryUnit(float *output, int size, int repeat)
{
    int gid = threadIdx.x + blockDim.x * blockIdx.x;
    int s = gid * 512;
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll 16 // Unroll loop for better performance
        for (int i = 0; i < 16; ++i)
        {
            output[(s + i) & (size - 1)] = gid;
        }
        s = (s + 16) & (size - 1);
    }
}