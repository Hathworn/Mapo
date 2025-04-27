#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Compute the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return;  // Overlapping kernel launch bounds check

    // Compute batch and channel indices
    int k = id % c;  // Channel index
    int b = id / c;  // Batch index

    // Precompute repeated expressions
    int in_offset = k + c * b;
    int out_index = in_offset;
    float val = out_delta[out_index] / (w * h);

    // Iterate over width and height
    for (int i = 0; i < w * h; ++i) {
        int in_index = i + w * h * in_offset;  // Calculate input index
        in_delta[in_index] += val;  // Accumulate result
    }
}