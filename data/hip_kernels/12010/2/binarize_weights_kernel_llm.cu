#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory for intermediate summation results to improve memory access efficiency
    extern __shared__ float shared_mean[];
    
    // Each thread computes a partial sum
    float local_mean = 0.0f;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        local_mean += abs(weights[f * size + i]);
    }
    
    // Atomic add to accumulate the results of each thread in the block
    atomicAdd(&shared_mean[threadIdx.x], local_mean);

    __syncthreads();

    // Single thread computes final mean for each block
    if (threadIdx.x == 0) {
        float block_mean = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            block_mean += shared_mean[i];
        }
        block_mean /= size;
        shared_mean[0] = block_mean;
    }

    __syncthreads();

    // All threads use the mean value computed above
    float mean = shared_mean[0];
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}