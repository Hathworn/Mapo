#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (i >= N) return;

    int b = i / (w * h * c * stride * stride);  // Calculate batch
    i = i % (w * h * c * stride * stride);
    
    int out_c = (i / (w * stride * h * stride)) % c;  // Calculate output channel
    int out_h = (i / (w * stride)) % (h * stride);  // Calculate output height
    int out_w = i % (w * stride);  // Calculate output width
    
    int in_w = out_w / stride;
    int in_h = out_h / stride;

    int in_index = b*w*h*c + out_c*w*h + in_h*w + in_w;  // Optimized for clarity

    if (forward) {
        out[i] += scale * x[in_index];  // Forward computation simplified
    } else {
        atomicAdd(&x[in_index], scale * out[i]);  // Use pointer directly
    }
}