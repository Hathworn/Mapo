#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryCoalesced(float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    int offsets[16] = {0, 32768, 65536, 98304, 131072, 163840, 196608, 229376, 262144, 294912, 327680, 360448, 393216, 425984, 458752, 491520};
    
    for (int j = 0; j < repeat; ++j) 
    {
        #pragma unroll  // Unroll loop to improve performance
        for (int i = 0; i < 16; ++i) 
        {
            output[(gid + offsets[i]) & (size - 1)] = gid;
        }
        gid = (gid + 524288) & (size - 1); // Update gid for next iteration
    }
}