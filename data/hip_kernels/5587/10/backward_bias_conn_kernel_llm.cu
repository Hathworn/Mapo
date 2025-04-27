#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Calculate the unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if thread index is out of bounds
    if (index >= n) return;

    // Initialize sum variable
    float sum = 0.0f;

    // Unroll loop to optimize memory access
    for(int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }

    // Update bias with computed sum
    atomicAdd(&bias_updates[index], sum);
}