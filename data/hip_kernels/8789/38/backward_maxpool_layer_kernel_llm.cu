#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, float *delta, float *prev_delta, int *indexes)
{
    int h = (in_h-1)/stride + 1;
    int w = (in_w-1)/stride + 1;
    int c = in_c;
    int area = (size-1)/stride;

    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Calculate indices
    int index = id;
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    int w_offset = (-size-1)/2 + 1;
    int h_offset = (-size-1)/2 + 1;

    float d = 0;

    // Unroll the loops and use fewer integer arithmetic operations
    #pragma unroll
    for(int l = -area; l < area+1; ++l){
        int out_h = (i-h_offset)/stride + l;
        if(out_h < 0 || out_h >= h) continue; // Skip invalid rows
        #pragma unroll
        for(int m = -area; m < area+1; ++m){
            int out_w = (j-w_offset)/stride + m;
            if(out_w >= 0 && out_w < w) { // Check column validity
                // Calculate the output index only once
                int out_index = out_w + w*(out_h + h*(k + c*b));
                d += (indexes[out_index] == index) ? delta[out_index] : 0;
            }
        }
    }
    prev_delta[index] += d;
}