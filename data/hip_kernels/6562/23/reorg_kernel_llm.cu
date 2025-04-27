#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit if index is greater than N
    if(i >= N) return;

    // Calculate input indices
    int in_w = i % w;
    int in_h = (i / w) % h;
    int in_c = (i / w / h) % c;
    int b = i / w / h / c;

    // Calculate output indices
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Conditional assignment based on forward flag
    if(forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}