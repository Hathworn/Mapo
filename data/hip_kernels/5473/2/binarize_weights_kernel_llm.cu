#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory to reduce data access latency
    __shared__ float shared_weights[1024]; // Adjust size based on block size
    int num_iter = (size + blockDim.x - 1) / blockDim.x;

    float mean = 0.0f;
    for (int i = 0; i < num_iter; ++i) {
        int index = f * size + i * blockDim.x + threadIdx.x;
        if (index < n * size) {
            shared_weights[threadIdx.x] = fabsf(weights[index]);
        } else {
            shared_weights[threadIdx.x] = 0.0f;
        }
        __syncthreads();

        // Accumulate mean for current block
        for (int j = 0; j < blockDim.x; ++j) {
            if (index < n * size) {
                mean += shared_weights[j];
            }
        }
        __syncthreads();
    }

    mean /= size;

    for (int i = 0; i < num_iter; ++i) {
        int index = f * size + i * blockDim.x + threadIdx.x;
        if (index < n * size) {
            binary[index] = (weights[index] > 0) ? mean : -mean;
        }
    }
}