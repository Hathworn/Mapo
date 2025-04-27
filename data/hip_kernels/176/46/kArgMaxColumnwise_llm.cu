#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kArgMaxColumnwise(float* mat, float* target, unsigned int width, unsigned int height) {
    __shared__ float max_vals[32];
    __shared__ unsigned int max_args[32];
    
    float cur_max = -2e38;
    unsigned int cur_arg = 0;
    float val = 0;
    
    // Use a loop stride to allow arbitrary block size 
    for (unsigned int i = threadIdx.x; i < height; i += blockDim.x) {
        val = mat[i * width + blockIdx.x];
        
        if (val > cur_max) {
            cur_max = val;
            cur_arg = i;
        }
    }
    
    max_vals[threadIdx.x] = cur_max;
    max_args[threadIdx.x] = cur_arg;
    
    __syncthreads();
    
    // Reduce within block to find the maximum
    if (threadIdx.x == 0) {
        cur_max = -2e38;
        cur_arg = 0;
        
        for (unsigned int i = 0; i < blockDim.x; i++) {
            if (max_vals[i] > cur_max) {
                cur_max = max_vals[i];
                cur_arg = max_args[i];
            }
        }
        
        target[blockIdx.x] = cur_arg;
    }
}