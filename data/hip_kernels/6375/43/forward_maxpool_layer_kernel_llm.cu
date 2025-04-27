#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, float *input, float *output, int *indexes)
{
    // Calculate output dimensions
    int h = (in_h-1)/stride + 1;
    int w = (in_w-1)/stride + 1;
    int c = in_c;

    // Calculate the unique global thread index for flattening
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if(id >= n) return;

    // Determine the positional indices in the output space
    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    int b = id / c;

    int w_offset = (-size-1)/2 + 1;
    int h_offset = (-size-1)/2 + 1;

    int out_index = j + w * (i + h * (k + c * b));
    float max = -INFINITY;
    int max_i = -1;

    // Optimize loop by unrolling
    for(int l = 0; l < size; ++l) {
        int cur_h = h_offset + i * stride + l;
        if (cur_h < 0 || cur_h >= in_h) continue;  // Early exit for invalid cur_h
        for(int m = 0; m < size; ++m) {
            int cur_w = w_offset + j * stride + m;
            if (cur_w < 0 || cur_w >= in_w) continue;  // Early exit for invalid cur_w
            int index = cur_w + in_w * (cur_h + in_h * (k + b * in_c));
            float val = input[index];
            if(val > max) {
                max = val;
                max_i = index;
            }
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}