#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nan_kernel(float* data, const bool* mask, int len, float nan) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    // Use shared memory to reduce memory access latency
    __shared__ bool shared_mask[BLOCK_SIZE];
    if (tid < len) {
        shared_mask[threadIdx.x] = mask[tid];
        __syncthreads();
        if (!shared_mask[threadIdx.x]) data[tid] = nan;
    }
}
```
