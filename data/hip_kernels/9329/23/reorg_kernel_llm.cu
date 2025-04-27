#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= N) return;

    // Calculate parameters for input and output indices
    int b = index / (w * h * c);
    int in_index = index % (w * h * c);
    int in_c = in_index / (w * h);
    in_index %= (w * h);
    int in_h = in_index / w;
    int in_w = in_index % w;

    int out_c = c / (stride * stride);
    int offset = in_c / out_c;
    int c2 = in_c % out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = ((b * out_c + c2) * h * stride + h2) * w * stride + w2;

    // Simplified conditional data transfer
    if (forward) {
        out[out_index] = x[index];
    } else {
        out[index] = x[out_index];
    }
}