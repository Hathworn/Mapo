#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Use shared memory for partial sums
    extern __shared__ float shared_sum[];
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Check bounds
    if (i >= groups) return;

    // Initialize shared memory
    shared_sum[tid] = 0;

    // Perform accumulation
    for (int k = 0; k < n; ++k) {
        shared_sum[tid] += x[k * groups + i];
    }

    // Write back to global memory
    sum[i] = shared_sum[tid];
}