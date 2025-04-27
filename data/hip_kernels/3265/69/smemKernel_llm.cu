#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smemKernel(int N, double *input, double *output) {
    int b_size = blockDim.x, b_idx = blockIdx.x, t_idx = threadIdx.x;
    int global_i = b_size * b_idx + t_idx, n_chk = (N + SHARE_SIZE - 1) / SHARE_SIZE;
    __shared__ double buff[SHARE_SIZE];
    
    double sum = 0.0; // Accumulate partial sums to avoid shared memory contention

    for(int q = 0; q < n_chk; ++q) {
        int left = q * SHARE_SIZE, right = min(left + SHARE_SIZE, N);
        
        for(int i = t_idx + left; i < right; i += b_size) {
            buff[i - left] = input[i];
        }

        __syncthreads();

        // Use local accumulator instead of updating global memory directly in loop
        for(int i = left; i < right; ++i) {
            sum += buff[i - left];
        }

        __syncthreads();
    }

    output[global_i] = sum / N; // Divide after accumulation to reduce division operations
}