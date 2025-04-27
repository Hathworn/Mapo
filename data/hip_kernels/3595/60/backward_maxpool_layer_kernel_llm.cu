#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Calculate output dimensions
    int h = (in_h + 2*pad)/stride;
    int w = (in_w + 2*pad)/stride;
    
    // Compute the search area size
    int area = (size-1)/stride;

    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Decode index into batch (b), channel (k), height (i), width (j)
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    // Offset for padding
    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0;

    // Iterate over neighborhood area
    for(int l = -area; l <= area; ++l){
        for(int m = -area; m <= area; ++m){
            // Calculate output indices
            int out_w = (j-w_offset)/stride + m;
            int out_h = (i-h_offset)/stride + l;
            int out_index = out_w + w * (out_h + h * (k + in_c * b));

            // Check validity and accumulate delta
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h && indexes[out_index] == id) {
                d += delta[out_index];
            }
        }
    }

    // Update previous layer's delta
    atomicAdd(&prev_delta[id], d);
}