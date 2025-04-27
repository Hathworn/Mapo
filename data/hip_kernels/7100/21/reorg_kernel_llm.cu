#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique global thread index
    if(idx >= N) return;

    // Calculate indices and addresses more efficiently
    int in_index = idx;
    int in_w = in_index % w;                   // in_w calculation
    in_index /= w;
    int in_h = in_index % h;                   // in_h calculation
    in_index /= h;
    int in_c = in_index % c;                   // in_c calculation
    in_index /= c;
    int b = in_index % batch;                  // batch calculation

    int out_c = c / (stride * stride);         // Calculate output channel

    int c2 = in_c % out_c;                     // Calculate channel offset
    int offset = in_c / out_c;
    int w2 = in_w * stride + (offset % stride); // Calculate output width
    int h2 = in_h * stride + (offset / stride); // Calculate output height

    // Calculate output index
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Conditional operator for compactness
    if (forward) {
        out[out_index] = x[idx];
    } else {
        out[idx] = x[out_index];
    }
}