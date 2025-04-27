#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Use shared memory for faster accumulation
    extern __shared__ float s_data[];

    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize shared memory for this thread
    s_data[threadIdx.x] = 0.0f;

    // Loop over elements and accumulate using shared memory
    for (int k = threadIdx.x; k < n; k += blockDim.x) {
        s_data[threadIdx.x] += x[k * groups + i];
    }

    // Synchronize threads within the block
    __syncthreads();

    // Atomic addition to global sum for the final result
    atomicAdd(&sum[i], s_data[threadIdx.x]);
}