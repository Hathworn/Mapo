#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Precompute repetitive expressions to enhance performance.
    int in_w = i % w;
    int in_h = (i / w) % h;
    int in_c = ((i / w) / h) % c;
    int b = (((i / w) / h) / c) % batch;

    int out_c = c / (stride * stride);
    int offset = in_c / out_c;
    
    // Inline calculations for offset components.
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (in_c % out_c + out_c * b));

    // Utilize conditional operator for concise assignment.
    if (forward) {
        out[out_index] = x[in_index];
    } else {
        out[in_index] = x[out_index];
    }
}