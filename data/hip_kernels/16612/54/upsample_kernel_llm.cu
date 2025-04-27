#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out) 
{
    // Calculate global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (i >= N) return;

    // Precompute factors for index conversion
    int wc_stride = w * stride;
    int hc_stride = h * stride;
    int wh = w * h;

    // Convert flat index to multidimensional indices
    int out_w = i % wc_stride;
    int out_h = (i / wc_stride) % hc_stride;
    int out_c = (i / (wc_stride * hc_stride)) % c;
    int b = (i / (wc_stride * hc_stride * c)) % batch;

    // Compute input indices
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_index = b * wh * c + out_c * wh + in_h * w + in_w;

    // Forward or backward operation
    if(forward) {
        // Forward pass: update output
        out[i] += scale * x[in_index];
    } else {
        // Backward pass: atomic add
        atomicAdd(x + in_index, scale * out[i]);
    }
}