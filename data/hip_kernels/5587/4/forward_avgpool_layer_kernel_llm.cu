#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    // Calculate unique index for each thread
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c; // Channel index
    int b = id / c; // Batch index

    int out_index = k + c * b; // Output index
    float sum = 0;

    // Unroll loop for performance
    int wh = w * h;
    for (int i = 0; i < wh; ++i) {
        int in_index = i + wh * (k + b * c); // Input index
        sum += input[in_index];
    }

    output[out_index] = sum / wh; // Compute average
}