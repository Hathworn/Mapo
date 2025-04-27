#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate unique global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i >= N) return;
    
    // Efficiently calculate output indices
    int temp = i;
    int out_w = temp % (w * stride);
    temp /= (w * stride);
    int out_h = temp % (h * stride);
    temp /= (h * stride);
    
    // Compute batch and channel indices
    int out_c = temp % c;
    int b = temp / c;
    
    // Map output indices to input indices
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;

    // Calculate flattened input index
    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Perform the upsample operation with branching on forward mode
    if (forward)
        out[i] += scale * x[in_index];
    else
        atomicAdd(&x[in_index], scale * out[i]);
}