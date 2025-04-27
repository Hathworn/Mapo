#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_values(float *num, size_t size, float abs_max)
{
    // Use shared memory for efficient access to thread data
    __shared__ float local_abs_max;
    if (threadIdx.x == 0)
    {
        local_abs_max = abs_max;
    }
    __syncthreads();

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size)
    {
        // Reuse loaded abs_max from shared memory
        num[idx] = (local_abs_max + local_abs_max) * num[idx] - local_abs_max;
    }
}