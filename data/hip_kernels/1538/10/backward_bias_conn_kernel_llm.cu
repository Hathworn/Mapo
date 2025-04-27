```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return; // Early exit for out of bounds index

    float sum = 0.0f;
    for (int b = 0; b < batch; ++b) {
        sum += delta[b * n + index]; // Accumulate delta values
    }
    atomicAdd(&bias_updates[index], sum); // Atomic operation for thread safety
}