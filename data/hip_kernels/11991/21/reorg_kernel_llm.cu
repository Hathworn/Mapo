#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (idx >= N) return; // Ensure we don't exceed the array bounds

    // Decompose the index into width, height, channel, and batch
    int in_w = idx % w;
    int in_h = (idx / w) % h;
    int in_c = (idx / (w * h)) % c;
    int b = idx / (w * h * c);

    // Calculate the output channel and offsets
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    // Calculate output index
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Perform the reorganization
    if (forward) out[out_index] = x[idx];
    else out[idx] = x[out_index];
}