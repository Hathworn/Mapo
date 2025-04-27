#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate the unique thread index within the total number of threads
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Calculate output pixel coordinates and channel indices
    int out_index = i;
    int out_w = (out_index / c) % (w * stride);
    int out_h = (out_index / (w * stride * c)) % (h * stride);
    int out_c = out_index % c;
    int b = out_index / (w * stride * h * stride * c);

    // Calculate the corresponding input pixel coordinates
    int in_w = out_w / stride;
    int in_h = out_h / stride;

    // Calculate the input index
    int in_index = b * w * h * c + out_c * w * h + in_h * w + in_w;

    // Perform the forward or backward pass
    if (forward) {
        out[out_index] += scale * x[in_index];
    } else {
        atomicAdd(x + in_index, scale * out[out_index]);
    }
}