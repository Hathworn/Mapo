#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory for mean to reduce global memory access
    __shared__ float temp[1024]; 
    float sum = 0.0f;

    // Each thread calculates a part of the mean value
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        sum += fabsf(weights[f * size + i]);
    }
    temp[threadIdx.x] = sum;

    // Reduce within the block to get the final mean
    __syncthreads();
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            temp[threadIdx.x] += temp[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Calculate mean using first thread of the block
    if (threadIdx.x == 0) {
        temp[0] = temp[0] / size;
    }
    __syncthreads();

    // Assign binary weights based on mean
    float mean = temp[0];
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}