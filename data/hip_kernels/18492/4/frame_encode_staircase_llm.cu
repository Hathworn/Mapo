#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void frame_encode_staircase(int *data, int *pcm, int param_k, int param_m, int w_f, int packet_size)
{
    int ps = packet_size / sizeof(int);

    // Use blockIdx.x to process different parts of data concurrently
    int block_offset = blockIdx.x * ps;
    int x = threadIdx.x;

    for (int index = param_k; index < param_k + param_m - 1; index++)
    {
        int offset = x;

        while (offset < ps)
        {
            // Optimize memory access patterns
            int dataIndex1 = (index + 1) * ps + block_offset + offset;
            int dataIndex2 = index * ps + block_offset + offset;
            data[dataIndex1] ^= data[dataIndex2];
            offset += blockDim.x;
        }
    }
}
```
