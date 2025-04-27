```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified 1D grid and block indexing
    if (i >= N) return;
    
    int in_index = i;
    int in_w = in_index % w;
    int in_h = (in_index / w) % h;
    int in_c = (in_index / (w * h)) % c;
    int b = (in_index / (w * h * c)) % batch;

    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    if (forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}