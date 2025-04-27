#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Use 1D grid and block indexing
    if(idx >= n * w * h * c) return;  // Increase parallel work

    int i = idx % (w * h);  // Calculate input index
    int k = (idx / (w * h)) % c;
    int b = idx / (w * h * c);

    int out_index = k + c * b;  // Calculate output index
    int in_index = i + w * h * (k + b * c);
    in_delta[in_index] += out_delta[out_index] / (w * h);  // Divide once instead of in loop
}