#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Exit if index is beyond N
    if (i >= N) return;

    int in_index = i;
    int in_w = i % w;
    i /= w;  // Simplified division
    int in_h = i % h;
    i /= h;
    int in_c = i % c;
    int b = i / c;  // Simplified division to avoid using additional divide
    
    // Precompute out channel
    int out_c = c / (stride * stride);

    // Precompute offsets
    int offset = in_c / out_c;
    int c2 = in_c % out_c;
    int w2 = in_w * stride + offset % stride;  
    int h2 = in_h * stride + offset / stride;  
    
    // Calculate output index
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Conditional assignment to output
    if (forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}