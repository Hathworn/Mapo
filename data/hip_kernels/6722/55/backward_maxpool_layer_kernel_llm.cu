#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes) {
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

    // Use a single loop to optimize the iteration over the pooling window
    for(int l = -area; l <= area; ++l){
        int out_h = (i - h_offset) / stride + l;
        if(out_h < 0 || out_h >= h) continue; // Check boundaries for better performance

        for(int m = -area; m <= area; ++m){
            int out_w = (j - w_offset) / stride + m;
            if(out_w < 0 || out_w >= w) continue; // Check boundaries for better performance

            int out_index = out_w + w*(out_h + h*(k + c*b));
            if (indexes[out_index] == index) {
                d += delta[out_index]; // Apply delta only when index matches
            }
        }
    }

    prev_delta[index] += d;
}