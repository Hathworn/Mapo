#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Compute indices and offsets for input and output
    int in_index = i;
    int in_w = i % w;
    i /= w; // Simplified division
    int in_h = i % h;
    i /= h; // Simplified division
    int in_c = i % c;
    i /= c; // Simplified division
    int b = i; // Direct assignment since i is now the batch index

    int out_c = c / (stride * stride);

    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Assign value based on forward flag
    if (forward) {
        out[out_index] = x[in_index];
    } else {
        out[in_index] = x[out_index];
    }
}