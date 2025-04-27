#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h + 2*pad)/stride;
    int w = (in_w + 2*pad)/stride;
    int c = in_c;
    int area = (size-1)/stride;

    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int index = id;
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;
    int l, m;
    
    // Optimize memory access pattern by reducing redundant calculations within the loop
    for(l = -area; l < area+1; ++l){
        for(m = -area; m < area+1; ++m){
            int out_w = (j-w_offset + m*stride)/stride;
            int out_h = (i-h_offset + l*stride)/stride;
            int out_index = out_w + w*(out_h + h*(k + c*b));
            // Precompute validity condition to minimize branching within the loop
            bool valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            if(valid && indexes[out_index] == index) {
                d += delta[out_index];
            }
        }
    }
    prev_delta[index] += d;
}