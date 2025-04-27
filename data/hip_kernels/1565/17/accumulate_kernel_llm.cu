#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize shared memory for block-level parallel reduction
    extern __shared__ float shared_sum[];
    shared_sum[threadIdx.x] = 0;

    // Accumulate with a stride to improve coalesced access and utilize shared mem
    for (int k = threadIdx.x; k < n; k += blockDim.x) {
        shared_sum[threadIdx.x] += x[k * groups + i];
    }

    // Synchronize to ensure all threads have completed their local sums
    __syncthreads();

    // Perform block-level reduction to sum into the global sum array
    if (threadIdx.x == 0) {
        for (int k = 1; k < blockDim.x; ++k) {
            shared_sum[0] += shared_sum[k];
        }
        sum[i] = shared_sum[0];
    }
}