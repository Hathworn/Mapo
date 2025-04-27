#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Calculate the unique thread index.
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is out of bounds.
    if (index >= n) return;
    
    float sum = 0; // Use register for sum
    
    // Use stride loop for better memory access pattern.
    for (int b = 0; b < batch; ++b) {
        sum += delta[b * n + index];
    }

    // Atomic add to prevent race conditions.
    atomicAdd(&bias_updates[index], sum);
}