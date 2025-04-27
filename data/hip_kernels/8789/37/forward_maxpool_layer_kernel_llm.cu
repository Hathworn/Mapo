#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, float *input, float *output, int *indexes)
{
    int h = (in_h-1)/stride + 1;
    int w = (in_w-1)/stride + 1;
    int c = in_c;

    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = (-size-1)/2 + 1;
    int h_offset = (-size-1)/2 + 1;

    int out_index = j + w*(i + h*(k + c*b));
    float max = -INFINITY;
    int max_i = -1;

    // Pre-compute for efficient access
    int base_h = h_offset + i * stride;
    int base_w = w_offset + j * stride;

    // Iterate over the pooling window
    for(int l = 0; l < size; ++l){
        int cur_h = base_h + l;
        if(cur_h < 0 || cur_h >= in_h) continue; // Skip out of bounds

        for(int m = 0; m < size; ++m){
            int cur_w = base_w + m;
            if(cur_w < 0 || cur_w >= in_w) continue; // Skip out of bounds

            int index = cur_w + in_w*(cur_h + in_h*(k + b*in_c));
            float val = input[index];
            if (val > max) {
                max = val;        // Update max
                max_i = index;    // Update index
            }
        }
    }

    output[out_index] = max;
    indexes[out_index] = max_i;
}