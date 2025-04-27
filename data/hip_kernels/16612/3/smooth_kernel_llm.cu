#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    // Compute global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Calculate indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    // Calculate output index
    int out_index = j + w * (i + h * (k + c * b));

    // Calculate offset
    int offset = size / 2;

    for(int l = -offset; l <= offset; ++l){
        int cur_h = i + l;
        for(int m = -offset; m <= offset; ++m){
            int cur_w = j + m;
            if(cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w){
                int index = cur_w + w * (cur_h + h * (k + b * c));
                // Update delta with valid elements
                delta[out_index] += rate * (x[index] - x[out_index]);
            }
        }
    }
}