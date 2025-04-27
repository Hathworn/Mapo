#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return;

    int k = id % c;
    int b = id / c;

    float sum = 0.0f;
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + h * w * (k + b * c);
        sum += input[in_index];
    }

    output[id] = sum / (w * h); // Efficiently compute average
}