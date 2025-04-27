#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void optimizedKernel(int N, float *input, float *output) {
    // Calculate global index
    int global_i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (global_i < N) {
        // Improvements: use shared memory to reduce global memory access
        extern __shared__ float shared_input[];
        
        // Cooperative loading into shared memory
        for (int i = threadIdx.x; i < N; i += blockDim.x) {
            shared_input[i] = input[i];
        }
        __syncthreads();
        
        // Accumulate results using shared memory
        float sum = 0.0f;
        for (int i = 0; i < N; ++i) {
            sum += shared_input[i];
        }

        // Store the result in global memory
        output[global_i] = sum / N;
    }
}