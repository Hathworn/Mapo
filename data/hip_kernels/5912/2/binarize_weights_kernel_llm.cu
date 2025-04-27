#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory to reduce global memory access
    extern __shared__ float shm[];
    float *shared_weights = shm;

    // Load weights into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabsf(weights[f * size + i]);
    }
    __syncthreads();

    // Calculate mean in shared memory
    float mean = 0;
    for (int i = 0; i < size; ++i) {
        mean += shared_weights[i];
    }
    mean /= size;

    // Binarize weights based on calculated mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}