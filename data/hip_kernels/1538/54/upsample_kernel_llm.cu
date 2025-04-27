#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate the global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return if the index goes beyond bounds
    if(i >= N) return;

    // Calculate output index mapping
    int out_index = i;
    int out_w = out_index % (w * stride);
    int out_h = (out_index / (w * stride)) % (h * stride);
    int out_c = (out_index / (w * stride * h * stride)) % c;
    int b = (out_index / (w * stride * h * stride * c)) % batch;

    // Calculate input index mapping
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_index = (b * c + out_c) * (w * h) + in_h * w + in_w;

    // Perform the forward or backward pass operation
    if(forward)
        out[out_index] += scale * x[in_index];
    else
        atomicAdd(x + in_index, scale * out[out_index]);
}