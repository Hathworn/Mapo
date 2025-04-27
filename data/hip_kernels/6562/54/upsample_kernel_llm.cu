#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate unique global index in the grid
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if index exceeds the range
    if(i >= N) return;

    // Use integer division and modulus in a single step
    int out_w = i % (w * stride);
    int out_h = (i / (w * stride)) % (h * stride);
    int out_c = (i / (w * stride) / (h * stride)) % c;
    int b = (i / (w * stride) / (h * stride) / c);

    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;

    // Pre-calculate index for input array
    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Efficiently handle forward and backward computation
    if(forward) 
        out[i] += scale * x[in_index];
    else 
        atomicAdd(x + in_index, scale * out[i]);
}