#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate global thread ID
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index >= N) return;

    // Calculate input coordinates
    int in_w = index % w;
    int in_h = (index / w) % h;
    int in_c = (index / (w * h)) % c;
    int b = index / (w * h * c);

    // Calculate output channel
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;

    // Calculate output width and height
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    // Compute output index
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Perform the reorganization
    if(forward)
        out[out_index] = x[index];
    else
        out[index] = x[out_index];
}