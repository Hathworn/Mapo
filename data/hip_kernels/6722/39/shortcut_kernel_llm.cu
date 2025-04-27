#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Pre-calculation of common terms to reduce operations
    int sample_w2 = w2 * sample;
    int sample_h2 = h2 * sample;
    int stride_w1 = w1 * stride;
    int stride_h1 = h1 * stride;

    int i = id % minw;
    int j = (id / minw) % minh;
    int k = (id / (minw * minh)) % minc;
    int b = id / (minw * minh * minc);

    int out_index = i * sample + sample_w2 * j + sample_h2 * (k + c2 * b);
    int add_index = i * stride + stride_w1 * j + stride_h1 * (k + c1 * b);

    out[out_index] += add[add_index];
}