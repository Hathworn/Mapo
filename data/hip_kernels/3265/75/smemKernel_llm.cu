```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smemKernel(int N, float *input, float *output) {
    int b_size = blockDim.x, b_idx = blockIdx.x, t_idx = threadIdx.x;
    int global_i = b_size * b_idx + t_idx;
    __shared__ float buff[SHARE_SIZE];
    
    // Reset output, only once instead of at every iteration
    if(global_i < N) {
        output[global_i] = 0.0f;
    }

    int n_chk = (N + SHARE_SIZE - 1) / SHARE_SIZE;
    for (int q = 0; q < n_chk; ++q) {
        int left = q * SHARE_SIZE, right = min(left + SHARE_SIZE, N);
        
        // Load elements into shared memory
        if (t_idx + left < right) {
            buff[t_idx] = input[t_idx + left];
        }
        __syncthreads();
        
        // Accumulate results
        if (global_i < N) {
            for (int i = 0; i < right - left; ++i) {
                output[global_i] += buff[i];
            }
        }
        __syncthreads();
    }
    
    // Final result normalization
    if(global_i < N) {
        output[global_i] /= N;
    }
}