#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_conn_kernel(float *bias_updates, float *delta, int batch, int n)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Use blockIdx.x only for 1D grid
    if (index >= n) return;

    float sum = 0.0f;
    // Unroll loop to improve performance
    for (int b = 0; b < batch; ++b) {
        int i = b * n + index;
        sum += delta[i];
    }

    bias_updates[index] += sum;
}