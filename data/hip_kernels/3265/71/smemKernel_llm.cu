#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smemKernel(int N, float *input, float *output) {
    int b_size = blockDim.x, b_idx = blockIdx.x, t_idx = threadIdx.x;
    int global_i = b_size * b_idx + t_idx;
    int n_chk = (N + SHARE_SIZE - 1) / SHARE_SIZE;
    __shared__ float buff[SHARE_SIZE];
    
    float temp_sum = 0.0f; // Accumulator for partial sum

    for (int q = 0; q < n_chk; ++q) {
        int left = q * SHARE_SIZE, right = min(left + SHARE_SIZE, N);
        
        // Efficiently load data into shared memory
        for (int i = t_idx + left; i < right; i += b_size) {
            buff[i - left] = input[i];
        }
        __syncthreads();
        
        if (global_i < N) {
            // Accumulate the local sum from shared memory
            for (int i = left; i < right; ++i) {
                temp_sum += buff[i - left];
            }
        }
        __syncthreads();
    }
    
    if (global_i < N) {
        // Store the averaged result in the output array
        output[global_i] = temp_sum / N;
    }
}