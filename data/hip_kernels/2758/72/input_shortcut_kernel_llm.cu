#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void input_shortcut_kernel(float *in, int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid and block
    if (id >= size) return;

    // Pre-calculate reused values to reduce repetitive operations
    int sample_w2 = sample * w2;
    int stride_w1 = stride * w1;
    int minwh = minw * minh;
    
    // Calculate indices based on flat id
    int b = id / (minc * minwh);
    int k = (id / minwh) % minc;
    int j = (id / minw) % minh;
    int i = id % minw;

    int out_index = i * sample + sample_w2 * (j + h2 * (k + c2 * b));
    int add_index = i * stride + stride_w1 * (j + h1 * (k + c1 * b));
    out[out_index] = in[out_index] + add[add_index];
}