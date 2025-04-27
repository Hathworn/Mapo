```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    extern __shared__ float shared_mean[]; // Use shared memory for mean
    int tid = threadIdx.x;
    float local_mean = 0;

    // Each thread computes partial mean
    for (int i = tid; i < size; i += blockDim.x) {
        local_mean += fabsf(weights[f * size + i]);
    }

    shared_mean[tid] = local_mean;
    __syncthreads();

    // Parallel reduction to compute full mean
    if (tid == 0) {
        float total_mean = 0;
        for (int i = 0; i < blockDim.x; ++i) {
            total_mean += shared_mean[i];
        }
        mean = total_mean / size;
        shared_mean[0] = total_mean / size;
    }
    __syncthreads();

    mean = shared_mean[0]; // All threads get the computed mean

    // Binarize weights
    for (int i = tid; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}