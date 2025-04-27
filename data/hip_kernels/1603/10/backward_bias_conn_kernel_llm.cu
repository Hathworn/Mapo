```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return;

    // Accumulate sum using a local variable
    float sum = 0.0f;
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }

    // Update bias_updates atomically to prevent race conditions
    atomicAdd(&bias_updates[index], sum);
}