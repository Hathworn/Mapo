#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Pre-compute indices for input and output
    int out_index = i;
    int out_w = out_index % (w*stride);
    int out_h = (out_index / (w*stride)) % (h*stride);
    int out_c = (out_index / (w*stride*h*stride)) % c;
    int b = out_index / (w*stride*h*stride*c);

    int in_w = out_w / stride;
    int in_h = out_h / stride;

    // Calculate input index
    int in_index = b*w*h*c + out_c*w*h + in_h*w + in_w;

    // Perform operation based on the direction flag (forward or backward)
    if (forward) {
        out[out_index] += scale * x[in_index];
    } else {
        atomicAdd(x + in_index, scale * out[out_index]);
    }
}