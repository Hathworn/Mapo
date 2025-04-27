#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void add(int n, float *a, float *sum)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Use shared memory to cache partial sums
    extern __shared__ float s_sum[];
    
    if (i < n)
    {
        float temp_sum = 0.0f;

        // Use a single loop to accumulate the sum
        for (int j = 0; j < n; j++)
        {
            temp_sum += a[i * n + j];
        }

        s_sum[threadIdx.x] = temp_sum;
        __syncthreads();

        // Aggregate results from shared memory
        if (threadIdx.x == 0) {
            float block_sum = 0.0f;
            for (int idx = 0; idx < blockDim.x; ++idx) {
                block_sum += s_sum[idx];
            }
            atomicAdd(&sum[blockIdx.x], block_sum);
        }
    }
}