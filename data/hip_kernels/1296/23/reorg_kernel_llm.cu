#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit if index exceeds the bounds
    if(i >= N) return;

    int in_index = i;

    // Calculate indices using modulo and division
    int b = i / (w * h * c);
    int in_c = (i / (w * h)) % c;
    int in_h = (i / w) % h;
    int in_w = i % w;

    // Optimize calculations by reusing divisions and avoiding redundant operations
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    // Calculate output index directly using optimized w2, h2, and c2
    int out_index = b * out_c * h * w * (stride * stride) + c2 * h * w * (stride * stride) + h2 * w * stride + w2;
    
    if(forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}