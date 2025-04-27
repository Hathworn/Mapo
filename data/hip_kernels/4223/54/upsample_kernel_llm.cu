#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= N) return;
    
    // Calculate indices for output and input
    int out_index = i;
    int b = i / (w * h * c * stride * stride);
    int remainder = i % (w * h * c * stride * stride);
    int out_c = remainder / (w * h * stride * stride);
    remainder = remainder % (w * h * stride * stride);
    int out_h = remainder / (w * stride);
    int out_w = remainder % (w * stride);

    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;
    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Perform operation based on direction
    if (forward) {
        out[out_index] += scale * x[in_index]; // Forward pass
    } else {
        atomicAdd(x + in_index, scale * out[out_index]); // Backward pass
    }
}