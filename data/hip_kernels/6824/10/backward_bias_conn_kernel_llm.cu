#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (index >= n) return;

    float sum = 0;
    for (int b = 0; b < batch; ++b) {
        sum += delta[b * n + index]; // Accumulate delta values
    }

    atomicAdd(&bias_updates[index], sum); // Use atomicAdd for thread safety
}