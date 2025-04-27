#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return;  // Adjusted boundary to n * c

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float sum = 0.0f;
    for (int i = 0; i < w * h; ++i) {  // Loop directly with w * h
        int in_index = i + w * h * (k + b * c);
        sum += input[in_index];
    }
    output[out_index] = sum / (w * h);  // Compute average directly
}