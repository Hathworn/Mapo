#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryUnit(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int s = gid * 512;

    // Unroll the loop to minimize loop overhead and achieve better performance
    for (int j = 0; j < repeat; ++j)
    {
        int baseIndex = s & (size - 1); // Calculate once to reuse
        #pragma unroll
        for (int i = 0; i < 16; ++i)
        {
            output[(baseIndex + i) & (size - 1)] = gid;
        }
        s += 16;
    }
}