#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimizedKernel(int N, float *input, float *output) {
    // Use shared memory to prevent loading from global memory repeatedly
    extern __shared__ float shared_input[];
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only load necessary data into shared memory once
    if (global_i < N) {
        if (threadIdx.x < N) {
            shared_input[threadIdx.x] = input[threadIdx.x];
        }
        __syncthreads();

        // Compute the output using shared memory data
        float sum = 0.0f;
        for(int i = 0; i < N; ++i) {
            sum += shared_input[i];
        }
        output[global_i] = sum / N;
    }
}