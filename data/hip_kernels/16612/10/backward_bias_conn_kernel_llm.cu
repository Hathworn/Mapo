#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    if (index >= n) return;
    
    float sum = 0;
    for(int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }
    atomicAdd(&bias_updates[index], sum); // Use atomicAdd for thread safety
}