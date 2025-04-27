#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smemKernel(int N, float *input, float *output){
    int b_size = blockDim.x, b_idx = blockIdx.x, t_idx = threadIdx.x;
    int global_i = b_size * b_idx + t_idx;
    __shared__ float buff[SHARE_SIZE];
    
    // Initialize output element
    float sum = 0.0f; 

    for(int q = 0, stride = SHARE_SIZE; q < N; q += stride){
        int left = q;
        int right = min(left + SHARE_SIZE, N);
        
        // Load input to shared memory in a coalesced manner
        if (t_idx + left < right) {
            buff[t_idx] = input[t_idx + left];
        }
        __syncthreads();
        
        // Accumulate values from shared memory to local sum
        for(int i = t_idx; i < (right - left); i += b_size) {
            sum += buff[i];
        }
        __syncthreads();
    }
    
    // Store the average in output
    if(global_i < N) {
        output[global_i] = sum / N;
    }
}