#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stats_kernel(int half_samps, float *d_sum, float *d_sum_square, float *d_signal_power)
{
    int t = blockIdx.x * blockDim.x * STATSLOOP + threadIdx.x;
    
    float sum = 0.0f;
    float sum_square = 0.0f;

    // Use shared memory for thread collaboration
    __shared__ float partial_sum[1024];
    __shared__ float partial_sum_square[1024];

    for (int i = t; i < t + STATSLOOP * blockDim.x; i += blockDim.x)
    {
        float local = d_signal_power[i];
        sum += local;
        sum_square += local * local;
    }

    partial_sum[threadIdx.x] = sum;
    partial_sum_square[threadIdx.x] = sum_square;

    __syncthreads();

    // Reduce sum and sum_square within the block
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (threadIdx.x < stride)
        {
            partial_sum[threadIdx.x] += partial_sum[threadIdx.x + stride];
            partial_sum_square[threadIdx.x] += partial_sum_square[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the results from the first thread of each block
    if (threadIdx.x == 0)
    {
        d_sum[blockIdx.x] = partial_sum[0];
        d_sum_square[blockIdx.x] = partial_sum_square[0];
    }
}