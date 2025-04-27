#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Compute global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; 
    if (idx >= N) return;

    // Pre-compute constants
    int out_c = c / (stride * stride);
    
    // Calculate indices
    int in_index = idx;
    int b = idx / (w * h * c);
    idx %= w * h * c;
    int in_c = idx / (w * h);
    idx %= w * h;
    int in_h = idx / w;
    int in_w = idx % w;

    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    if (forward) {
        out[out_index] = x[in_index];
    } else {
        out[in_index] = x[out_index];
    }
}