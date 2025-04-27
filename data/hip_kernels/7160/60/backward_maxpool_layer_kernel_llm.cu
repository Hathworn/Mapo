#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2*pad) / stride;
    int w = (in_w + 2*pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int temp_id = id;
    int j = temp_id % in_w;
    temp_id /= in_w;
    int i = temp_id % in_h;
    temp_id /= in_h;
    int k = temp_id % in_c;
    temp_id /= in_c;
    int b = temp_id;

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;
    for(int l = -area; l < area + 1; ++l) {
        for(int m = -area; m < area + 1; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));
            bool valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            d += (valid && indexes[out_index] == id) ? delta[out_index] : 0; // Accumulate delta for valid and matching index
        }
    }
    atomicAdd(&prev_delta[id], d); // Atomically add delta to prevent write conflicts
}