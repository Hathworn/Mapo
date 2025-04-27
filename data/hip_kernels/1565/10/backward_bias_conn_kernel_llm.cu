#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_sum[];
    shared_sum[threadIdx.x] = 0.0;

    // Accumulate in shared memory
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        shared_sum[threadIdx.x] += delta[i];
    }

    __syncthreads(); // Ensure all threads complete shared memory accumulation
    
    // Reduce within block
    if (threadIdx.x == 0) {
        float blockSum = 0.0;
        for (int i = 0; i < blockDim.x; ++i) {
            blockSum += shared_sum[i];
        }
        atomicAdd(&bias_updates[blockIdx.x], blockSum);
    }
}