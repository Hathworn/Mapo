```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Get the global threadId
    if(id >= n) return;

    // Calculate indices for batch (b) and channel (k)
    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float out_value = out_delta[out_index] / (w * h);

    // Unroll and optimize the loop with stride to improve performance
    for(int i = 0; i < w * h; i += blockDim.x) {
        int in_index = i + h * w * (k + b * c) + threadIdx.x;
        if (in_index < w * h * c * b) {
            in_delta[in_index] += out_value;
        }
    }
}