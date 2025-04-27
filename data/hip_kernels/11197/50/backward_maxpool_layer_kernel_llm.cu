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

    const int index = id;
    int j = index % in_w;
    int i = (index / in_w) % in_h;
    int k = (index / (in_w * in_h)) % in_c;
    int b = index / (in_c * in_h * in_w);

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0.0f; // initialization using float f
    #pragma unroll // Unroll the loops for better parallelism
    for(int l = -area; l <= area; ++l) {
        for(int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset)/stride + m;
            int out_h = (i - h_offset)/stride + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));
            if (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h) { // Combine condition check
                d += (indexes[out_index] == index) ? delta[out_index] : 0.0f;
            }
        }
    }
    prev_delta[index] += d;
}