#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryCoalesced(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int j = 0;

    // Using shared memory to reduce global memory access
    extern __shared__ float sharedOutput[];

    for (j = 0; j < repeat; ++j)
    {
        int s = gid;

        // Loop unrolling for improved memory access pattern
        #pragma unroll
        for (int offset = 0; offset < 524288; offset += 32768)
        {
            sharedOutput[threadIdx.x] = gid; // Coalesced write
            output[(s + offset) & (size - 1)] = sharedOutput[threadIdx.x];
        }

        s = (s + 524288) & (size - 1);
    }
}