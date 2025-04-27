#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n * c) return;  // Unroll grid dimension combination
    
    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    int num_elements = w * h;
    float out_val = out_delta[out_index] / num_elements; // Precompute division

    for (int i = 0; i < num_elements; ++i) {
        int in_index = i + num_elements * (k + b * c);
        atomicAdd(&in_delta[in_index], out_val); // Atomic add to handle race conditions
    }
}