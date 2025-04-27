#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Use shared memory for group sum accumulation
    __shared__ float shared_sum[1024];  // Adjust size if necessary

    shared_sum[threadIdx.x] = 0;
    for (int k = threadIdx.x; k < n; k += blockDim.x) {
        shared_sum[threadIdx.x] += x[k * groups + i];
    }

    // Synchronize threads before writing back to global memory
    __syncthreads();

    // Atomic add to aggregate results across threads
    atomicAdd(&sum[i], shared_sum[threadIdx.x]);
}