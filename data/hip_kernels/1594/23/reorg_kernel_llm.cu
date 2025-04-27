#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= N) return;
    
    // Precompute common expressions to reduce calculations
    const int hw = w * h;
    const int chw = c * hw;
    
    // Determine the indexes within the multi-dimensional data
    int b = idx / chw;
    int channel_remainder = idx % chw;
    
    int in_c = channel_remainder / hw;
    int hw_remainder = channel_remainder % hw;
    
    int in_h = hw_remainder / w;
    int in_w = hw_remainder % w;
    
    // Compute output channel and corresponding offset
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    
    // Calculate position in the output based on the stride
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    
    // Compute the output index using precomputed constants to improve indexing efficiency
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));
    
    // Forward or backward operation
    if (forward) 
        out[out_index] = x[idx];
    else 
        out[idx] = x[out_index];
}