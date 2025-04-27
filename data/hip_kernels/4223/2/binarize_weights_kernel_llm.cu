#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Pre-compute shared variables
    extern __shared__ float shared[];
    float* shared_weights = shared;

    int i = threadIdx.x;
    float mean = 0;

    // Parallel mean calculation using shared memory
    for (int stride = 0; stride < size; stride += blockDim.x) {
        if (stride + i < size) {
            shared_weights[i] = fabsf(weights[f * size + stride + i]);
        }
        __syncthreads();

        for (int j = blockDim.x / 2; j > 0; j /= 2) {
            if (i < j) {
                shared_weights[i] += shared_weights[i + j];
            }
            __syncthreads();
        }
        
        if (i == 0) {
            mean += shared_weights[0];
        }
        __syncthreads();
    }

    // Normalize mean
    if (i == 0) mean /= size;
    __syncthreads();

    // Binarize weights
    if (i < size) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}