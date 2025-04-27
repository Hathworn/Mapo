#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void sum_channels(float *dest, const float *src, uint channels, uint num_channel_elem)
{
    // Compute absolute thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and return if index is outside
    if (idx >= num_channel_elem) return;
    
    // Use shared memory for performance improvement
    extern __shared__ float shared_src[];

    // Load data into shared memory
    for (uint i = threadIdx.x; i < channels * num_channel_elem; i += blockDim.x) {
        shared_src[i] = src[i];
    }

    // Synchronize to ensure shared memory is fully loaded
    __syncthreads();

    float acc = 0;

    // Accumulate values from shared memory
    for (uint i = 0; i < channels; ++i) {
        acc += shared_src[idx + i * num_channel_elem];
    }

    // Write accumulated result to destination
    dest[idx] = acc;
}
```
