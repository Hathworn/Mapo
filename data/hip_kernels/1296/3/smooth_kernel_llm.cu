#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    // Calculate global thread index
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Indices for width, height, channels, and batch
    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    // Pre-compute offsets
    int w_offset = -(size / 2);
    int h_offset = -(size / 2);
    int out_index = j + w * (i + h * (k + c * b));

    // Update delta based on valid neighbor pixels
    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        if (cur_h >= 0 && cur_h < h) {  // Check height bounds
            for (int m = 0; m < size; ++m) {
                int cur_w = w_offset + j + m;
                if (cur_w >= 0 && cur_w < w) {  // Check width bounds
                    int index = cur_w + w * (cur_h + h * (k + b * c));
                    delta[out_index] += rate * (x[index] - x[out_index]);
                }
            }
        }
    }
}