#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    float sum = 0;
    // Unroll loop for better performance
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }
    // Use atomic operation to minimize write conflicts 
    atomicAdd(&bias_updates[index], sum);
}