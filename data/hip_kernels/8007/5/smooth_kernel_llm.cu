#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = -(size / 2.f);
    int h_offset = -(size / 2.f);

    int out_index = j + w * (i + h * (k + c * b));
    int valid, cur_h, cur_w, index;
    float diff;

    for (int l = 0; l < size; ++l)
    {
        for (int m = 0; m < size; ++m)
        {
            cur_h = h_offset + i + l;
            cur_w = w_offset + j + m;
            valid = (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w);
            if (valid)
            {
                index = cur_w + w * (cur_h + h * (k + c * b));
                diff = x[index] - x[out_index];
                delta[out_index] += rate * diff;
            }
        }
    }
}