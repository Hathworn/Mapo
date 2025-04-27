#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    float mean = 0.0f;
    int offset = f * size;

    // Use shared memory to accumulate the sum for enhanced performance
    extern __shared__ float shared_sum[];
    shared_sum[threadIdx.x] = 0.0f;

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_sum[threadIdx.x] += fabsf(weights[offset + i]);
    }
    __syncthreads();

    // Reduce the sum in shared memory
    int block_size = blockDim.x;
    while (block_size > 1) {
        int half = (block_size + 1) >> 1; 
        if (threadIdx.x < half && (threadIdx.x + half) < blockDim.x) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + half];
        }
        __syncthreads();
        block_size = half;
    }

    if (threadIdx.x == 0) {
        mean = shared_sum[0] / size;
    }
    __syncthreads();

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[offset + i] = (weights[offset + i] > 0) ? mean : -mean;
    }
}