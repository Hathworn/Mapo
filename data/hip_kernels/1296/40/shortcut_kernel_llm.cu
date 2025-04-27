#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Calculate indices efficiently
    int b = id / (minw * minh * minc);
    int rest = id % (minw * minh * minc);
    int k = rest / (minw * minh);
    rest = rest % (minw * minh);
    int j = rest / minw;
    int i = rest % minw;

    // Calculate output and add indices
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    // Perform computation with simplified access
    out[out_index] = s1 * out[out_index] + s2 * add[add_index];
}