#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= n) return;

    // Calculate indices
    int j = id % w;
    int i = (id / w) % h;
    int k = (id / (w * h)) % c;
    int b = id / (w * h * c);

    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    int out_index = j + w * (i + h * (k + c * b));
    float out_value = x[out_index]; // Cache x[out_index] value

    int l_start = max(-h_offset, -i);
    int l_end = min(size - h_offset, h - i);
    int m_start = max(-w_offset, -j);
    int m_end = min(size - w_offset, w - j);

    for (int l = l_start; l < l_end; ++l) {
        for (int m = m_start; m < m_end; ++m) {
            int cur_h = h_offset + i + l;
            int cur_w = w_offset + j + m;
            int index = cur_w + w * (cur_h + h * (k + c * b));
            delta[out_index] += rate * (x[index] - out_value);
        }
    }
}