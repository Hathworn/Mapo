#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -(size / 2);
    int h_offset = -(size / 2);
    int out_index = j + w * (i + h * (k + c * b));

    // Pre-calculate indices to reduce redundant computations inside the loops
    float out_value = x[out_index];

    for(int l = 0; l < size; ++l){
        int cur_h = h_offset + i + l;
        if(cur_h >= 0 && cur_h < h) {  // Only proceed if cur_h is valid
            for(int m = 0; m < size; ++m){
                int cur_w = w_offset + j + m;
                if(cur_w >= 0 && cur_w < w) {  // Only proceed if cur_w is valid
                    int index = cur_w + w * (cur_h + h * (k + b * c));
                    delta[out_index] += rate * (x[index] - out_value);
                }
            }
        }
    }
}