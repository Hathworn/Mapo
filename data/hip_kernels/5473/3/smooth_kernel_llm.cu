```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    // Calculate unique thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Precompute constants and offsets
    int hw = w * h;
    int whc = hw * c;
    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    // Compute indices
    int b = id / whc;
    int temp = id % whc;
    int k = temp / hw;
    temp = temp % hw;
    int i = temp / w;
    int j = temp % w;

    int out_index = j + w * (i + h * (k + c * b));
    int l, m;

    // Loop over kernel size
    for (l = 0; l < size; ++l) {
        for (m = 0; m < size; ++m) {
            int cur_h = h_offset + i + l;
            int cur_w = w_offset + j + m;

            // Validate boundaries
            if (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w) {
                int index = cur_w + w * (cur_h + h * (k + b * c));
                atomicAdd(&delta[out_index], rate * (x[index] - x[out_index])); // Atomic addition to avoid race conditions
            }
        }
    }
}