#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    // Calculate the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Safeguard condition: only consider valid indices
    if (id >= n * c * w * h) return;

    // Optimize indexing
    // Compute batch, channel, and spatial indices
    int spatial_index = id % (w * h);
    int k = (id / (w * h)) % c;
    int b = id / (c * w * h);

    // Compute indices for input and output deltas
    int in_index = spatial_index + w * h * (k + b * c);
    int out_index = k + c * b;

    // Update input delta
    in_delta[in_index] += out_delta[out_index] / (w * h);
}