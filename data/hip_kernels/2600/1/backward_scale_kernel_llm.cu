#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;
    
    // Unroll the loops for better memory access patterns
    for(int b = 0; b < batch; ++b){
        for(int i = p; i < size; i += BLOCK){
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();
    
    // Use a reduction pattern for better efficiency
    if (p == 0) {
        float block_sum = 0;
        for(int i = 0; i < BLOCK; ++i) {
            block_sum += part[i];
        }
        atomicAdd(&scale_updates[filter], block_sum);
    }
}