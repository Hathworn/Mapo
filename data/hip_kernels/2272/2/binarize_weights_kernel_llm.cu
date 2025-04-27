#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    // Calculate the global index
    int f = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check for out-of-bounds
    if (f >= n) return;

    // Shared memory for mean calculations
    __shared__ float shared_mean[1024];

    int i = threadIdx.x;
    float local_mean = 0.0f;

    // Calculate part of the mean
    for (; i < size; i += blockDim.x) {
        local_mean += fabsf(weights[f * size + i]);
    }
    
    // Store partial sums in shared memory
    shared_mean[threadIdx.x] = local_mean;
    
    // Synchronize the threads
    __syncthreads();

    // Reduce to calculate total mean
    if (threadIdx.x == 0) {
        float total_mean = 0.0f;
        for (int j = 0; j < blockDim.x; ++j) {
            total_mean += shared_mean[j];
        }
        shared_mean[0] = total_mean / size;
    }
    
    // Synchronize again
    __syncthreads();

    // Use the computed mean to binarize weights
    float mean_value = shared_mean[0];
    for (i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean_value : -mean_value;
    }
}