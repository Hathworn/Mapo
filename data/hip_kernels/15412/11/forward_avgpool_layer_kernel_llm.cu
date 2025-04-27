#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float sum = 0.0f;
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + h * w * (k + b * c);
        sum += input[in_index];
    }
    output[out_index] = sum / (w * h); // optimize: compute average once
}