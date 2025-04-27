#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Precompute values to reduce redundant calculations
    int w_h = w * h;
    int w_h_c = w_h * c;

    // Calculate indices with fewer operations
    int in_index = i;
    int b = i / w_h_c;
    int in_c = (i / w_h) % c;
    int in_h = (i / w) % h;
    int in_w = i % w;

    int out_c = c / (stride * stride);
    int offset = in_c / out_c;
    int c2 = in_c % out_c;

    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Minimized conditional checks
    if (forward)
        out[out_index] = x[in_index];
    else
        x[in_index] = out[out_index];
}