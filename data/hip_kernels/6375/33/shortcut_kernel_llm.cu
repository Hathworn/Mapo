#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Pre-compute common multiplications outside the index calculations
    int stride_w1 = w1 * stride;
    int sample_w2 = w2 * sample;
    int h1_c1 = h1 * c1;
    int h2_c2 = h2 * c2;

    int i = id % minw;
    int j = (id / minw) % minh;
    int k = (id / (minw * minh)) % minc;
    int b = id / (minw * minh * minc);

    int out_index = i * sample + sample_w2 * j + h2_c2 * b + w2 * k;
    int add_index = i * stride + stride_w1 * j + h1_c1 * b + w1 * k;
    
    out[out_index] += add[add_index];
}