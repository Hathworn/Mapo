#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if (index >= N) return;
    
    // Precompute values outside the nested calculations
    int totalStrideW = w * stride;
    int totalStrideH = h * stride;
    int whc = w * h * c;

    int out_index = index;
    int out_w = out_index % totalStrideW;
    int out_h = (out_index / totalStrideW) % totalStrideH;
    int out_c = (out_index / (totalStrideW * totalStrideH)) % c;
    int b = (out_index / (totalStrideW * totalStrideH * c)) % batch;

    // Calculate input coordinates
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    
    // Flatten the input index
    int in_index = b * whc + out_c * w * h + in_h * w + in_w;

    if (forward) 
        out[out_index] += scale * x[in_index];
    else 
        atomicAdd(x + in_index, scale * out[out_index]);
}