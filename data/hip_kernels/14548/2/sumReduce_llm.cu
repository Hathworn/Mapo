```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define INTERVALS 1000000

// Max number of threads per block
#define THREADS 512
#define BLOCKS 64

double calculatePiCPU();

// Synchronous error checking call. Enable with nvcc -DDEBUG
__global__ static void sumReduce(int *n, float *g_sum)
{
    int tx = threadIdx.x;
    __shared__ float s_sum[THREADS];

    // Initialize shared memory
    s_sum[tx] = (tx < BLOCKS) ? g_sum[tx * THREADS] : 0.0f;
    __syncthreads(); // Ensure all shared memory is initialized

    // Use optimized loop for reduction
    for (int i = blockDim.x / 2; i > 0; i >>= 1)
    {
        if (tx < i)
        {
            s_sum[tx] += s_sum[tx + i];
        }
        __syncthreads(); // Synchronize threads before the next iteration
    }

    // Write result from shared memory to global memory
    if (tx == 0) g_sum[blockIdx.x] = s_sum[0];
}