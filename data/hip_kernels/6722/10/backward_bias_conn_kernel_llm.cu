#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Use shared memory to store partial sums for a block
    extern __shared__ float shared_sum[];
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;
    
    if (index < n) {
        float sum = 0;
        for (int b = 0; b < batch; ++b) {
            int i = b * n + index;
            sum += delta[i];
        }
        shared_sum[tid] = sum;
    } else {
        shared_sum[tid] = 0;
    }

    __syncthreads();

    // Perform parallel reduction within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            shared_sum[tid] += shared_sum[tid + stride];
        }
        __syncthreads();
    }

    // Write the result to global memory (one thread per block writes)
    if (tid == 0) {
        atomicAdd(&bias_updates[blockIdx.x], shared_sum[0]);
    }
}