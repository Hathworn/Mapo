#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Precompute reusable indices
    int b = id / (w * h * c);
    int rem = id % (w * h * c);
    int k = rem / (w * h);
    rem = rem % (w * h);
    int i = rem / w;
    int j = rem % w;

    int out_index = j + w * (i + h * (k + c * b));
    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    for (int l = 0; l < size; ++l) {
        for (int m = 0; m < size; ++m) {
            int cur_h = h_offset + i + l;
            int cur_w = w_offset + j + m;
            int index = cur_w + w * (cur_h + h * (k + b * c));

            // Use a boolean flag to simplify conditional assignment
            bool valid = (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w);
            delta[out_index] += valid ? rate * (x[index] - x[out_index]) : 0;
        }
    }
}