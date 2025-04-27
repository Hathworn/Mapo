#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory to compute the mean more efficiently
    extern __shared__ float shared_weights[];

    float sum = 0.0f;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabsf(weights[f * size + i]);
        sum += shared_weights[i];
    }

    // Reduce sum within the block
    __shared__ float block_sum;
    block_sum = 0.0f;
    __syncthreads();

    atomicAdd(&block_sum, sum);
    __syncthreads();

    float mean = block_sum / size;

    // Assign binary values
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}