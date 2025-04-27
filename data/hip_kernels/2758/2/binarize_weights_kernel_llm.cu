#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    extern __shared__ float shared_mean[];  // Use shared memory for mean

    float mean = 0.0f;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        mean += fabs(weights[f*size + i]);
    }

    shared_mean[threadIdx.x] = mean;
    __syncthreads();

    // Reduce mean across block
    if (threadIdx.x == 0) {
        float total_mean = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            total_mean += shared_mean[i];
        }
        shared_mean[0] = total_mean / size;
    }
    __syncthreads();

    mean = shared_mean[0];

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f*size + i] = (weights[f*size + i] > 0) ? mean : -mean;
    }
}