#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int w_size = w * size;
    int wc = w * c;

    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (wc * h);

    int out_index = j + w * (i + h * (k + b * c));

    int half_size = size / 2;
    int w_offset = -half_size;
    int h_offset = -half_size;

    int cur_h, cur_w, index;
    bool valid;

    #pragma unroll
    for(int l = 0; l < size; ++l){
        #pragma unroll
        for(int m = 0; m < size; ++m){
            cur_h = i + h_offset + l;
            cur_w = j + w_offset + m;
            index = cur_w + w * (cur_h + h * (k + b * c));

            // Check boundaries
            valid = (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w);
            
            // Reduce conditional offset to a single operation
            delta[out_index] += valid ? rate * (x[index] - x[out_index]) : 0;
        }
    }
}