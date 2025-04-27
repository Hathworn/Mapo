#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % w;         // Calculate w index
    int bc_h = id / w;      // Pre-calculate block and height index
    int i = bc_h % h;       // Extract h index
    int kc_b = bc_h / h;    // Pre-calculate channel and batch index
    int k = kc_b % c;       // Extract channel index
    int b = kc_b / c;       // Extract batch index

    int out_index = j + w * (i + h * (k + b * c));
    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    float delta_val = 0; // Accumulator for delta update
    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        if (cur_h >= 0 && cur_h < h) { // Check valid height once per row
            for (int m = 0; m < size; ++m) {
                int cur_w = w_offset + j + m;
                if (cur_w >= 0 && cur_w < w) { // Check valid width
                    int index = cur_w + w * (cur_h + h * (k + b * c));
                    delta_val += rate * (x[index] - x[out_index]);
                }
            }
        }
    }
    delta[out_index] += delta_val; // Update delta once per thread
}