#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Calculate input coordinates
    int in_w = i % w;
    int in_h = (i / w) % h;
    int in_c = (i / (w * h)) % c;
    int b = (i / (w * h * c)) % batch;

    // Calculate output channel and index transformations
    int out_c = c / (stride * stride);
    int offset = in_c / out_c;
    int c2 = in_c % out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Conditional forward or backward operation
    if (forward)
        out[out_index] = x[i];
    else
        out[i] = x[out_index];
}