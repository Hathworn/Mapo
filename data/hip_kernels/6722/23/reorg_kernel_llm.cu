#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index >= N) return;

    int in_index = index;
    int in_w = index % w;
    int in_h = (index / w) % h;
    int in_c = (index / (w * h)) % c;
    int b = index / (w * h * c);
    
    int out_c = c / (stride * stride);
    int offset = in_c / out_c;
    int c2 = in_c % out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Perform the read/write operation
    if(forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}