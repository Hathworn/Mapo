#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return; // Ensure all indices are processed

    int k = id % c;
    int b = id / c;

    float sum = 0.0f; // Use a local variable to accumulate result
    int out_index = (k + c * b);
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + w * h * (k + b * c);
        sum += input[in_index]; // Accumulate the input values
    }
    output[out_index] = sum / (w * h); // Calculate the average
}