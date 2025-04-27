#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int w_offset = -(size / 2.f);
    int h_offset = -(size / 2.f);

    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int out_index = j + w * (i + h * (k + c * b));
    float delta_accum = 0;  // Accumulates delta for atomic update

    for (int l = 0; l < size; ++l) {
        int cur_h = h_offset + i + l;
        if (cur_h < 0 || cur_h >= h) continue;  // Early exit if out of bounds

        for (int m = 0; m < size; ++m) {
            int cur_w = w_offset + j + m;
            if (cur_w < 0 || cur_w >= w) continue;  // Early exit if out of bounds

            int index = cur_w + w * (cur_h + h * (k + b * c));
            delta_accum += rate * (x[index] - x[out_index]);
        }
    }

    // Atomic add to handle concurrent writes
    atomicAdd(&delta[out_index], delta_accum);
}