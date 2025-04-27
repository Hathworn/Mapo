#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate multi-dimensional indices
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

    // Initialize accumulation variable
    float acc = 0.0f;

    // Optimize loop by combining condition check within processing
    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        bool h_valid = (cur_h >= 0 && cur_h < h);
        for (int m = 0; m < size; ++m) {
            int cur_w = w_offset + j + m;
            if (h_valid && cur_w >= 0 && cur_w < w) {
                int index = cur_w + w * (cur_h + h * (k + b * c));
                acc += rate * (x[index] - x[out_index]);
            }
        }
    }
    // Update delta after accumulation
    delta[out_index] += acc;
}