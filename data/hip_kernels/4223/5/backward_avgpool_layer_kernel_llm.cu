#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c; // Combine operations for better readability and performance

    int out_index = k + c * b;
    float out_val = out_delta[out_index] / (w * h); // Precompute accumulated value
    int base_in_index = h * w * (k + b * c); // Precompute base index

    for(int i = 0; i < w * h; ++i) {
        int in_index = i + base_in_index;
        in_delta[in_index] += out_val; // Use precomputed value to reduce computation
    }
}