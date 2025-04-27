#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    extern __shared__ float shared_weights[]; // Use shared memory
    float mean = 0.0f;

    // Load weights to shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabs(weights[f*size + i]);
    }
    __syncthreads();

    // Calculate mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        mean += shared_weights[i];
    }
    __syncthreads();

    // Reduce mean within a block
    if (threadIdx.x == 0) {
        for (int i = 1; i < blockDim.x; i++) {
            mean += shared_weights[i];
        }
        mean = mean / size;
    }
    __syncthreads();

    // Broadcast the mean value
    mean = shared_weights[0];

    // Binarize weights
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f*size + i] = (weights[f*size + i] > 0) ? mean : -mean;
    }
}