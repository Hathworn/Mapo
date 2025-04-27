#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread index is within the array bounds
    if (i >= N) return;

    // Calculate indexes for input and output locations
    const int in_index = i;
    const int in_w = i % w;
    i /= w;
    const int in_h = i % h;
    i /= h;
    const int in_c = i % c;
    i /= c;
    const int b = i % batch;

    const int out_c = c / (stride * stride);

    const int c2 = in_c % out_c;
    const int offset = in_c / out_c;
    const int w2 = in_w * stride + offset % stride;
    const int h2 = in_h * stride + offset / stride;

    // Calculate output index using precomputed values
    const int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Assign the output using the calculated index
    out[in_index] = x[out_index];
}