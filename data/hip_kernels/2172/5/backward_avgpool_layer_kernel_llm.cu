#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Compute basic index parameters
    int total_wh = w * h;
    int rem_id = id;
    int k = rem_id % c;
    rem_id /= c;
    int b = rem_id;

    // Pre-calculate indices to reduce repeated calculation
    int out_index = k + c * b;
    float delta_part = out_delta[out_index] / total_wh;

    // Loop across the width-height space for this example-channel pair
    int start_index = h * w * (k + b * c);
    for (int i = 0; i < total_wh; ++i) {
        // Directly updating in_delta without recomputing in_index in each iteration
        in_delta[start_index + i] += delta_part;
    }
}