```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define INTERVALS 1000000
#define THREADS 512
#define BLOCKS 64

double calculatePiCPU();

__global__ void integrateOptimised(int *n, float *g_sum)
{
    // Calculate global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int tx = threadIdx.x;

    // Shared memory to hold the sum for each block
    __shared__ float s_sum[THREADS];

    float sum = 0.0f;
    float step  = 1.0f / (float)(*n);

    // Unroll the loop to improve performance
    for (int i = idx + 1; i <= *n; i += blockDim.x * gridDim.x)
    {
        float x = step * ((float)i - 0.5f);
        sum += 4.0f / (1.0f + x*x);
    }
    s_sum[tx] = sum * step;

    // Synchronize threads within the block
    __syncthreads();

    // Use reduction pattern with fewer synchronization points
    for (int i = blockDim.x / 2; i > 0; i >>= 1)
    {
        if (tx < i)
        {
            // Accumulate partial results into shared memory
            s_sum[tx] += s_sum[tx + i];
        }
        __syncthreads();
    }

    // Write the block's result to global memory, only by one thread
    if (tx == 0) g_sum[blockIdx.x] = s_sum[0];
}