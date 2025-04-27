#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_softmax_layer_kernel(int n, int batch, float *input, float temp, float *output)
{
    int b = blockIdx.x * blockDim.x + threadIdx.x;  // Use simpler block index calculation
    if (b >= batch) return;

    float sum = 0;
    float largest = -INFINITY;

    // Use shared memory for storing intermediate results to reduce global memory access
    extern __shared__ float shared_input[];
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        shared_input[i] = input[i + b * n];
    }
    __syncthreads();

    // Find the largest value
    for (int i = 0; i < n; ++i) {
        largest = fmaxf(shared_input[i], largest);
    }

    // Compute exponentials and sum them
    for (int i = 0; i < n; ++i) {
        sum += expf((shared_input[i] / temp) - (largest / temp));
    }

    sum = (sum != 0) ? (largest/temp + logf(sum)) : (largest - 100);

    // Compute final output values
    for (int i = 0; i < n; ++i) {
        output[i + b * n] = expf((shared_input[i] / temp) - sum);
    }
}