#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naiveKernel(int N, float *input, float *output) {
    // Use shared memory for better memory access speed
    __shared__ float sharedInput[1024];  // Example size, should match with the block size
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    int thread_i = threadIdx.x;

    // Load data into shared memory
    if (thread_i < N) {
        sharedInput[thread_i] = input[thread_i];
    }
    __syncthreads();

    if (global_i < N) {
        float sum = 0.0f;
        // Use shared memory for sum calculation
        for (int i = 0; i < N; ++i) {
            sum += sharedInput[i];
        }
        output[global_i] = sum / N;
    }
}