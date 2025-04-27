#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if(index >= N) return;
    
    // Calculate indices with improved variable reuse and clarity
    int in_stride_w = w * h * c;
    int in_stride_h = w * h;
    int out_stride_w = w * stride;
    int out_stride_h = h * stride;
    
    int b = (index / (c * out_stride_h)) % batch;
    int out_c = (index / out_stride_h) % c;
    int out_h = (index / out_stride_w) % (h * stride);
    int out_w = index % (w * stride);
    
    int in_h = out_h / stride;
    int in_w = out_w / stride;
    
    int in_index = b * in_stride_w + out_c * in_stride_h + in_h * w + in_w;
    
    // Perform operation based on `forward` flag
    if(forward) {
        out[index] += scale * x[in_index];
    } else {
        atomicAdd(x + in_index, scale * out[index]);
    }
}