#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory for performance improvement
    extern __shared__ float shared_weights[];
    float mean = 0;

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabsf(weights[f * size + i]);
    }
    __syncthreads();

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        atomicAdd(&mean, shared_weights[i]);
    }
    __syncthreads();

    mean = mean / size;

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}