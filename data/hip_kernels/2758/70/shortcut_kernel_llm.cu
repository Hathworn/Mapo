#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (id >= size) return;

    // Pre-compute reused terms to reduce repeated calculations
    int temp_size = id;
    int i = temp_size % minw;
    int offset_w = temp_size / minw;
    int j = offset_w % minh;
    int offset_h = offset_w / minh;
    int k = offset_h % minc;
    int b = offset_h / minc;

    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b)); // Calculate output index
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b)); // Calculate add index
    out[out_index] += add[add_index];
}