#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Compute the global index for the thread
    int s = blockIdx.x * blockDim.x + threadIdx.x;
    if (s >= size) return; // Ensure within bounds

    float mean = 0.0f;

    // Use shared memory for mean accumulation
    __shared__ float shared_mean[1024];
    float local_sum = 0.0f;

    // Step through each sample for this thread and accumulate mean
    for (int i = 0; i < n; ++i) {
        local_sum += fabsf(input[i * size + s]);
    }

    // Store local sum in shared memory and synchronize
    shared_mean[threadIdx.x] = local_sum;
    __syncthreads();

    // Use a single thread to compute the mean from shared memory
    if (threadIdx.x == 0) {
        float block_sum = 0.0f;
        for (int j = 0; j < blockDim.x; ++j) {
            block_sum += shared_mean[j];
        }
        mean = block_sum / (n * blockDim.x);
    }

    // Broadcast the computed mean value to all threads
    __syncthreads();
    if (threadIdx.x == 0) {
        shared_mean[0] = mean;
    }
    __syncthreads();
    mean = shared_mean[0];

    // Binarize inputs based on the mean value
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}