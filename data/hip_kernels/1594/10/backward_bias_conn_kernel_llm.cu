#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Initialize shared memory for thread group reduction
    extern __shared__ float shared_sum[];
    shared_sum[threadIdx.x] = 0;

    // Accumulate delta within the batch using shared memory
    int b;
    for(b = 0; b < batch; ++b){
        int i = b * n + index;
        shared_sum[threadIdx.x] += delta[i];
    }

    // Ensure all threads have written to shared memory
    __syncthreads();

    // Use parallel reduction to sum values in shared memory
    for(int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result from the first thread in the block
    if (threadIdx.x == 0) {
        bias_updates[index] += shared_sum[0];
    }
}