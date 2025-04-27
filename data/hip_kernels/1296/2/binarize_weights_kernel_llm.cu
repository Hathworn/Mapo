#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory for faster access within the block
    extern __shared__ float shared_weights[];
    
    // Load weights into shared memory and calculate mean
    float mean = 0;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabsf(weights[f * size + i]);
        atomicAdd(&mean, shared_weights[i]);
    }
    __syncthreads();

    // Calculate mean average
    mean = mean / size;

    // Binarize weights using precomputed mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}