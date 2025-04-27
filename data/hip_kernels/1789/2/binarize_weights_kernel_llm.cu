#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;
    
    // Use shared memory to reduce global memory access
    extern __shared__ float shared_weights[];
    
    int idx = threadIdx.x;
    float mean = 0;
    
    // Load data into shared memory
    for (int i = idx; i < size; i += blockDim.x) {
        shared_weights[i] = fabs(weights[f * size + i]);
    }
    __syncthreads();
    
    // Compute the mean using shared memory
    for (int i = idx; i < size; i += blockDim.x) {
        atomicAdd(&mean, shared_weights[i]);
    }
    
    // Calculate mean
    if (idx == 0) {
        mean /= size;
    }
    __syncthreads();
    
    // Binarize weights
    for (int i = idx; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}