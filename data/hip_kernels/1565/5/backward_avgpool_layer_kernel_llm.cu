```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // 1D indexing
    if (id >= n * w * h) return;  // Return if out of bounds

    int wh = w * h;
    int offset = id / wh;  // Calculate offset for channels and batch
    int i = id % wh;  // Calculate local index within w*h

    int k = offset % c;
    int b = offset / c;

    int in_index = i + wh * (k + b * c);  // Flattened index
    int out_index = k + c * b;

    in_delta[in_index] += out_delta[out_index] / wh;  // Perform operation
}