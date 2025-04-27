#include "hip/hip_runtime.h"
#include "includes.h"

#define INTERVALS 1000000
#define THREADS 512
#define BLOCKS 64

double calculatePiCPU();

// Optimized global kernel function
__global__ void integrateSimple(float *sum, float step, int threads, int blocks)
{
    // Utilizing shared memory for intermediate results to reduce global memory access
    __shared__ float local_sum[THREADS];

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int local_idx = threadIdx.x;

    local_sum[local_idx] = 0.0f;

    for (int i = idx; i < INTERVALS; i += threads * blocks)
    {
        float x = (i + 0.5f) * step;
        local_sum[local_idx] += 4.0f / (1.0f + x*x);
    }

    // Synchronize threads within block
    __syncthreads();

    // Reduce sum within the block using first thread
    if (local_idx == 0) {
        float block_sum = 0.0f;
        for (int i = 0; i < THREADS; ++i) {
            block_sum += local_sum[i];
        }
        atomicAdd(sum, block_sum);
    }
}