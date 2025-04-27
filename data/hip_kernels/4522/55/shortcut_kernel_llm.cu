#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Use integer math to calculate indices to avoid divisions
    int temp = id;
    int i = temp % minw;
    temp /= minw;
    int j = temp % minh;
    temp /= minh;
    int k = temp % minc;
    temp /= minc;
    int b = temp % batch;

    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    // Minimize memory reads by caching computed values
    float out_val = out[out_index];
    float add_val = add[add_index];

    // Calculate the result directly into the output
    out[out_index] = s1 * out_val + s2 * add_val;
}