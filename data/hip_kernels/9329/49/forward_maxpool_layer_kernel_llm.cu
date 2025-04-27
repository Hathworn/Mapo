#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + 2*pad)/stride;
    int w = (in_w + 2*pad)/stride;

    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // calculate initial indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % in_c;
    int b = id / (w * h * in_c);

    int out_index = j + w*(i + h*(k + in_c*b));
    float max = -INFINITY;
    int max_i = -1;

    int w_offset = -pad;
    int h_offset = -pad;

    // combine the loops for better cache locality
    for(int l = 0; l < size; ++l) {
        int cur_h = h_offset + i*stride + l;
        for(int m = 0; m < size; ++m) {
            int cur_w = w_offset + j*stride + m;
            int index = cur_w + in_w*(cur_h + in_h*(k + b*in_c));
            if (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w) {
                float val = input[index];
                if(val > max) { // directly update max and max_i
                    max = val;
                    max_i = index;
                }
            }
        }
    }
    output[out_index] = max;
    indexes[out_index] = max_i;
}