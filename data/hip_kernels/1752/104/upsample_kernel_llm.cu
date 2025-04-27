#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified to 1D grid
    if(i >= N) return;

    int out_index = i; // Keep out_index to set the output
    int s = stride * stride;
    int offset = out_index % s; 

    int out_w = (out_index / s) % w;
    int out_h = (out_index / (s * w)) % h;
    int out_c = (out_index / (s * w * h)) % c;
    int b = out_index / (s * w * h * c);
    
    int in_w = out_w;
    int in_h = out_h;
    int in_c = out_c;

    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w; // Compute input index

    if(forward) 
        out[out_index] += scale * x[in_index];
    else 
        atomicAdd(x + in_index, scale * out[out_index]);
}