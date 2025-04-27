#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    float mean = 0;
    // Use shared memory for mean calculation to reduce global memory accesses
    __shared__ float shared_weights[1024]; // Assuming a max block size of 1024

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = abs(weights[f * size + i]);
    }
    __syncthreads(); // Ensure all shared memory loads are complete

    // Parallel reduction to compute mean
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s && (threadIdx.x + s) < size) {
            shared_weights[threadIdx.x] += shared_weights[threadIdx.x + s];
        }
        __syncthreads();
    }

    if(threadIdx.x == 0) {
        mean = shared_weights[0] / size;
    }
    __syncthreads(); // Ensure all threads get the computed mean

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}