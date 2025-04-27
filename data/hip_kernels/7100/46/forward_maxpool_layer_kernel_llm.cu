```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *input, float *output, int *indexes)
{
    int h = (in_h + 2*pad)/stride;
    int w = (in_w + 2*pad)/stride;
    int c = in_c;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Exit early if id is out of bounds
    if(id >= n) return;

    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -pad;
    int h_offset = -pad;

    int out_index = j + w*(i + h*(k + c*b));
    float max = -INFINITY;
    int max_i = -1;

    // Unroll the nested loop to potentially increase performance
    #pragma unroll
    for(int l = 0; l < size; ++l){
        for(int m = 0; m < size; ++m){
            int cur_h = h_offset + i*stride + l;
            int cur_w = w_offset + j*stride + m;
            int index = cur_w + in_w*(cur_h + in_h*(k + b*in_c));
            int valid = (cur_h >= 0 && cur_h < in_h && cur_w >= 0 && cur_w < in_w);
            float val = (valid != 0) ? input[index] : -INFINITY;

            if (val > max) {
                max = val;
                max_i = index;
            }
        }
    }

    output[out_index] = max;
    indexes[out_index] = max_i;
}