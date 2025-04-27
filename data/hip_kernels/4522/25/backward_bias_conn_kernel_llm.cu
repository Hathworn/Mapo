#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Use shared memory to optimize accumulation
    extern __shared__ float shared_sum[];
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= n) return;

    float sum = 0.0f;
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }
    shared_sum[threadIdx.x] = sum;

    // Synchronize threads
    __syncthreads();

    // Reduce sum in shared memory
    if (threadIdx.x == 0) {
        float block_sum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            block_sum += shared_sum[i];
        }
        atomicAdd(&bias_updates[blockIdx.x + blockIdx.y * gridDim.x], block_sum);
    }
}