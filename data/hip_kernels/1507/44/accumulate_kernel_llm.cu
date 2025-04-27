#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;
    
    // Use shared memory for faster accumulation
    extern __shared__ float shared_sum[];
    shared_sum[threadIdx.x] = 0;

    for (int k = 0; k < n; ++k)
    {
        shared_sum[threadIdx.x] += x[k * groups + i];
    }
    
    // Use thread synchronization
    __syncthreads();

    // Write back the result to global memory
    sum[i] = shared_sum[threadIdx.x];
}