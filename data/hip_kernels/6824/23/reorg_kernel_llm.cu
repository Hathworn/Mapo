#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Precompute values that are used multiple times
    int width_stride = w * stride;
    int area_stride = width_stride * h * stride;
    int out_c_total = c / (stride * stride);

    int in_w = i % w;
    i /= w;
    int in_h = i % h;
    i /= h;
    int in_c = i % c;
    i /= c;
    int b = i % batch;

    int c2 = in_c % out_c_total;
    int offset = in_c / out_c_total;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = w2 + width_stride * (h2 + h * stride * (c2 + out_c_total * b));

    // Use ternary operator for compactness
    if (forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}