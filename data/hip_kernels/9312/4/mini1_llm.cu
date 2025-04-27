#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mini1(int *a, int *b, int n)
{
    // Use shared memory for reduced memory access latency
    __shared__ int shared_min[256];

    int local_idx = threadIdx.x;
    int global_idx = blockIdx.x * blockDim.x + local_idx;
    int block_size = blockDim.x;
    int mini = 7888888;

    // Compute the local minimum in parallel
    if (global_idx < n) {
        mini = a[global_idx];
    }
    shared_min[local_idx] = mini;

    // Synchronize to ensure all threads copied their value
    __syncthreads();

    // Reduce to find the local block minimum
    for (int stride = block_size / 2; stride > 0; stride >>= 1) {
        if (local_idx < stride && (global_idx + stride) < n) {
            shared_min[local_idx] = min(shared_min[local_idx], shared_min[local_idx + stride]);
        }
        __syncthreads();
    }

    // Write the block minimum to the output array
    if (local_idx == 0) {
        b[blockIdx.x] = shared_min[0];
    }
}