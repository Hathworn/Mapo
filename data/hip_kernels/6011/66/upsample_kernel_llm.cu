#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride_w = w * stride;
    size_t stride_h = h * stride;
    if (i >= N) return;
    
    // Precompute repeated values to reduce calculations
    int out_c = (i / (stride_w * stride_h)) % c;
    int b = (i / (stride_w * stride_h * c)) % batch;
    int out_h = (i / stride_w) % stride_h;
    int out_w = i % stride_w;

    // Utilize modulo and division only where necessary for better performance
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_index = b*w*h*c + out_c*w*h + in_h*w + in_w;

    if (forward) 
        out[i] += scale * x[in_index];
    else 
        atomicAdd(x + in_index, scale * out[i]);
}