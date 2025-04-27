#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Utilize shared memory to calculate mean more efficiently
    extern __shared__ float shared_weights[];
    float mean = 0;
    
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = abs(weights[f * size + i]);
    }
    __syncthreads();

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        atomicAdd(&mean, shared_weights[i]);
    }
    __syncthreads();

    mean = mean / size;

    // Binarize weights with mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}