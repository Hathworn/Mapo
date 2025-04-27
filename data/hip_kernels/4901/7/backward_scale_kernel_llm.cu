#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Optimize loop ordering for better memory access pattern
    for(int i = p; i < size; i += BLOCK) {
        for(int b = 0; b < batch; ++b) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }
    
    part[p] = sum;
    __syncthreads();
    
    // Use parallel reduction for performance improvement
    for(int stride = BLOCK / 2; stride > 0; stride >>= 1) {
        if(p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    // Single thread writes to global memory
    if (p == 0) {
        scale_updates[filter] = part[0];
    }
}