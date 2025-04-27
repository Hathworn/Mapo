#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    if (id >= n * c) return;

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b; // Compute once, used inside loop
    int num_elements = w * h; // Calculate total elements in advance

    // Unroll loop for improved efficiency, assuming w*h is a multiple of 4
    for (int i = 0; i < num_elements; i += 4) {
        int in_index = i + num_elements * (k + b * c);
        float delta = out_delta[out_index] / num_elements;
        in_delta[in_index] += delta;
        if(i + 1 < num_elements) in_delta[in_index + 1] += delta;
        if(i + 2 < num_elements) in_delta[in_index + 2] += delta;
        if(i + 3 < num_elements) in_delta[in_index + 3] += delta;
    }
}