#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x; // Compute unique thread index
    if(i >= N) return;
    
    // Decompose the index to multi-dimensional indices
    size_t tmp = i;
    int out_w = tmp % (w * stride); tmp /= (w * stride);
    int out_h = tmp % (h * stride); tmp /= (h * stride);
    int out_c = tmp % c;             tmp /= c;
    int b     = tmp % batch;

    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;

    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Use conditional operation efficiently
    if(forward) {
        out[i] += scale * x[in_index]; // Use 'i' directly
    } else {
        atomicAdd(&x[in_index], scale * out[i]); // Use 'i' directly
    }
}