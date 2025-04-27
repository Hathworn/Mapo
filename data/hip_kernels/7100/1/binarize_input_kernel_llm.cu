#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate the global thread index
    int s = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (s >= size) return;

    float mean = 0;
    // Use shared memory for partial sums
    __shared__ float partial_sum[256]; // Assume blockDim.x <= 256

    // Calculate partial sums of absolute values
    float sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += abs(input[i * size + s]);
    }

    // Store partial sum in shared memory
    partial_sum[threadIdx.x] = sum / n;

    // Reduce shared memory to compute mean
    __syncthreads();
    if (threadIdx.x == 0) {
        float block_mean = 0;
        for (int j = 0; j < blockDim.x; ++j) {
            block_mean += partial_sum[j];
        }
        mean = block_mean / blockDim.x;
    }
    __syncthreads();

    // Binarize the input based on computed mean
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}