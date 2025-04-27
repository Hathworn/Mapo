#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel optimized for performance
__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= N) return; // Early exit if out of bounds

    int batchSize = w * h * c;
    int in_c = (idx / (w * h)) % c;
    int in_h = (idx / w) % h;
    int in_w = idx % w;

    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * (idx / batchSize))); // Reorganized indexing

    if (forward)
        out[out_index] = x[idx]; // Writing based on forward flag
    else
        out[idx] = x[out_index]; // Reverse write
}