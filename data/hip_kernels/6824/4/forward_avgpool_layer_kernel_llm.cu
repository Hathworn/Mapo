#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Calculate unique global thread ID.
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return;

    // Calculate batch and channel indexes.
    int b = id / c;
    int k = id % c;
    int out_index = k + c * b;

    // Initialize sum to zero.
    float sum = 0.0f;

    // Use local variable to accumulate sum for better performance.
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + (w * h * (k + b * c));
        sum += input[in_index];
    }

    // Store the averaged result in output.
    output[out_index] = sum / (w * h);
}