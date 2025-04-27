```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return if index is out of bounds
    if (i >= N) return;

    // Precompute common divisions to reduce redundant calculations
    int wh = w * h;
    int wc = w * c;
    int hc = h * c;
    int stride2 = stride * stride;
    int out_c = c / stride2;

    // Decompose index into b, c, h, w
    int in_index = i;
    int b = i / wc;
    i %= wc;
    int in_c = i / wh;
    i %= wh;
    int in_h = i / w;
    int in_w = i % w;

    // Offset calculations for output
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    // Calculate output index
    int out_index = (b * out_c + c2) * stride * stride * wh + h2 * stride * w + w2;

    // Perform operation based on 'forward' flag
    if (forward) {
        out[out_index] = x[in_index];
    } else {
        out[in_index] = x[out_index];
    }
}