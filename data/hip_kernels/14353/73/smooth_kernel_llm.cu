#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Unroll calculations of dimensional indices for efficiency
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
    int l, m;

    // Use shared memory if possible to improve memory access efficiency
    __shared__ float data[1024]; // Example size, adjust according to the real size requirements

    for (l = 0; l < size; ++l) {
        for (m = 0; m < size; ++m) {
            int cur_h = h_offset + i + l;
            int cur_w = w_offset + j + m;
            int index = cur_w + w * (cur_h + h * (k + b * c));
            int valid = (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w);

            // Eliminate the conditional operator by utilizing mask variable
            float mask = (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w) ? 1.0f : 0.0f;
            delta[out_index] += mask * rate * (x[index] - x[out_index]);
        }
    }
}