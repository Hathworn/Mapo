#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryUnit(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int s = gid * 512;
    int max_index = size - 1;

    for (int j = 0 ; j < repeat ; ++j)
    {
        // Unroll loop and calculate address outside of the loop
        #pragma unroll
        for (int i = 0; i < 16; ++i)
        {
            output[(s + i) & max_index] = gid;
        }
        s = (s + 16) & max_index;
    }
}