```c
#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if(i >= N) return;

    // Compute input coordinates
    int in_index = i;
    int in_w = i % w;
    i /= w;
    int in_h = i % h;
    i /= h;
    int in_c = i % c;
    i /= c;
    int b = i % batch;

    // Calculate output channel and offset
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;

    // Compute output coordinates
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Assign values based on direction
    if(forward) {
        out[out_index] = x[in_index];
    } else {
        out[in_index] = x[out_index];
    }
}