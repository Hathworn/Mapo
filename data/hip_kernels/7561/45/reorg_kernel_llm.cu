#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (idx >= N) return;
    
    int b = (idx / (w * h * c)) % batch;
    int in_c = (idx / (w * h)) % c;
    int in_h = (idx / w) % h;
    int in_w = idx % w;

    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    
    int out_index = b * (out_c * h * stride * w * stride) + c2 * (h * stride * w * stride) + h2 * w * stride + w2;

    if (forward)
        out[out_index] = x[idx];
    else
        out[idx] = x[out_index];
}