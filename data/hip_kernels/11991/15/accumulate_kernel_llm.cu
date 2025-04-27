#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize local sum for each thread
    float local_sum = 0.0f;

    // Use local accumulation before writing to global memory to minimize global memory accesses
    for (int k = 0; k < n; ++k)
    {
        local_sum += x[k * groups + i];
    }

    // Write the local sum to global memory
    sum[i] = local_sum;
}