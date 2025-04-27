#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryCoalesced(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int s = gid;
    int offset[] = {0, 32768, 65536, 98304, 131072, 163840, 196608, 229376, 
                    262144, 294912, 327680, 360448, 393216, 425984, 458752, 491520};

    // Loop unrolling for better performance
    for (int j=0; j<repeat; ++j)
    {
        #pragma unroll
        for (int i=0; i<16; ++i)
        {
            output[(s + offset[i]) & (size-1)] = gid;
        }
        s = (s + 524288) & (size-1);
    }
}
```
