#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    int out_index = j + w * (i + h * (k + c * b));
    float out_value = x[out_index];  // Cache x[out_index] for reuse

    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        if (cur_h < 0 || cur_h >= h) continue;  // Skip invalid rows
        for (int m = 0; m < size; ++m) {
            int cur_w = w_offset + j + m;
            if (cur_w < 0 || cur_w >= w) continue;  // Skip invalid columns
            int index = cur_w + w * (cur_h + h * (k + b * c));
            delta[out_index] += rate * (x[index] - out_value);
        }
    }
}