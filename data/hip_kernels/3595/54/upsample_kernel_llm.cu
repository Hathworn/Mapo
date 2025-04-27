#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate global index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Precompute stride dimensions
    int stride_w = w * stride;
    int stride_h = h * stride;

    // Calculate output indices efficiently
    int out_index = i;
    int out_w = i % stride_w;
    i /= stride_w;
    int out_h = i % stride_h;
    i /= stride_h;
    int out_c = i % c;
    i /= c;
    int b = i % batch;

    // Calculate input indices efficiently
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;

    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Perform the operation based on the forward flag
    if (forward) {
        out[out_index] += scale * x[in_index];  // Simplified expression
    } else {
        atomicAdd(x + in_index, scale * out[out_index]);  // Simplified expression
    }
}