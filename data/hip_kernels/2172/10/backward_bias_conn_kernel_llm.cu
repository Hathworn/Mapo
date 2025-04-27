#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= n) return; // Early exit if out of bounds

    float sum = 0;
    // Accumulate delta over batch
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }
    // Update bias
    bias_updates[index] += sum;
}