#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use shared memory for faster access
    extern __shared__ float shared_mem[];
    
    int thread_id = threadIdx.x;
    int global_id = blockIdx.x * blockDim.x + thread_id;
    
    // Load data into shared memory
    if(global_id < n) {
        shared_mem[thread_id] = truth[global_id] - pred[global_id];
    }
    __syncthreads();
    
    if(global_id < n) {
        float diff = shared_mem[thread_id];
        float abs_val = fabsf(diff);
        if(abs_val < 1.0f) {
            error[global_id] = diff * diff;
            delta[global_id] = diff;
        }
        else {
            error[global_id] = 2.0f * abs_val - 1.0f;
            delta[global_id] = copysignf(1.0f, diff);
        }
    }
}