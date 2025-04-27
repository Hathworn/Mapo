#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void var(int *a, int *b, int n, float mean)
{
    int tid = threadIdx.x;
    int block = 256 * blockIdx.x;
    __shared__ float shared_sum[256]; // Use shared memory

    float local_sum = 0.0f;

    // Unroll loop for performance
    for (int i = block + tid; i < min(block + 256, n); i += 256)
    {
        float diff = a[i] - mean;
        local_sum += diff * diff;
    }

    // Store each thread's local sum in shared memory
    shared_sum[tid] = local_sum;
    __syncthreads(); // Ensure all threads have written their local sum

    // Reduce within the block using parallel reduction
    if (tid < 128) shared_sum[tid] += shared_sum[tid + 128];
    __syncthreads();
    if (tid < 64) shared_sum[tid] += shared_sum[tid + 64];
    __syncthreads();
    if (tid < 32)
    {
        shared_sum[tid] += shared_sum[tid + 32];
        shared_sum[tid] += shared_sum[tid + 16];
        shared_sum[tid] += shared_sum[tid + 8];
        shared_sum[tid] += shared_sum[tid + 4];
        shared_sum[tid] += shared_sum[tid + 2];
        shared_sum[tid] += shared_sum[tid + 1];
    }

    // First thread writes the block's result
    if (tid == 0)
    {
        b[blockIdx.x] = shared_sum[0];
    }
}