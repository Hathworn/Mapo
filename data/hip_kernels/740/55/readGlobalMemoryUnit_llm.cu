```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readGlobalMemoryUnit(float *data, float *output, int size, int repeat)
{
    // Pre-compute the unique global index for each thread
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    float sum = 0;
  
    // Loop to repeat the operation as per requirement
    for (int j = 0; j < repeat; ++j)
    {
        // Iteratively load data in chunks
        #pragma unroll // Unroll loop for better performance
        for (int i = 0; i < 512; i += 16)
        {
            int base_idx = (gid * 512 + i) & (size - 1);
            sum += data[base_idx + 0] + data[base_idx + 1] + data[base_idx + 2] + data[base_idx + 3] +
                   data[base_idx + 4] + data[base_idx + 5] + data[base_idx + 6] + data[base_idx + 7] +
                   data[base_idx + 8] + data[base_idx + 9] + data[base_idx + 10]+ data[base_idx + 11] +
                   data[base_idx + 12]+ data[base_idx + 13]+ data[base_idx + 14]+ data[base_idx + 15];
        }
    }
    // Store result in global memory
    output[gid] = sum;
}