#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stats_kernel(int half_samps, float *d_sum, float *d_sum_square, float *d_signal_power)
{
    // Use shared memory to reduce global memory access
    __shared__ float shared_sum[256];
    __shared__ float shared_sum_square[256];
    
    int t = blockIdx.x * blockDim.x * STATSLOOP + threadIdx.x;
    int idx = threadIdx.x;

    float local = 0.0;
    float sum = 0.0;
    float sum_square = 0.0;

    // Loop unrolling and use of shared memory for better performance
    for (int i = 0; i < STATSLOOP; i++)
    {
        local = d_signal_power[t + i * blockDim.x];
        sum += local;
        sum_square += local * local;
    }
    
    // Store partial sums in shared memory
    shared_sum[idx] = sum;
    shared_sum_square[idx] = sum_square;

    __syncthreads();  // Ensure all threads have written to shared memory

    // Parallel reduction within block for final sum and sum_square
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) 
    {
        if (idx < stride) 
        {
            shared_sum[idx] += shared_sum[idx + stride];
            shared_sum_square[idx] += shared_sum_square[idx + stride];
        }
        __syncthreads();
    }

    // Write the result of reduction for each block to global memory
    if (idx == 0)
    {
        d_sum[blockIdx.x] = shared_sum[0];
        d_sum_square[blockIdx.x] = shared_sum_square[0];
    }
}