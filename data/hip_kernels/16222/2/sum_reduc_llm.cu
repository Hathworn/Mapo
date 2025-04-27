#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_reduc(int* data, int* len, int* width) {
    int stride = blockDim.x * gridDim.x;
    int sum = 0;
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < *len; i += stride) {
        sum += data[i];
    }
    __shared__ int shared_sum[256]; // Use shared memory for reduction
    int tx = threadIdx.x;
    shared_sum[tx] = sum;
    __syncthreads();

    // Reduce within block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tx < s) {
            shared_sum[tx] += shared_sum[tx + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tx == 0) data[blockIdx.x] = shared_sum[0];
}