#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Use shared memory to reduce global memory access
    __shared__ float shared_sum[256]; // assuming blockDim.x <= 256
    shared_sum[threadIdx.x] = 0;

    // Accumulate sum for each batch
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        shared_sum[threadIdx.x] += delta[i];
    }

    // Perform reduction within block
    __syncthreads();
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Add the partial sums to global memory
    if (threadIdx.x == 0) {
        atomicAdd(&bias_updates[index], shared_sum[0]);  // Use atomic operation to avoid race conditions
    }
}