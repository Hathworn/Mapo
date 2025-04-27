#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified ID calculation
    if (id >= size) return;

    // Calculate indices reversed for better performance
    int b = id / (minw * minh * minc);
    int remaining = id % (minw * minh * minc);
    int k = remaining / (minw * minh);
    remaining %= (minw * minh);
    int j = remaining / minw;
    int i = remaining % minw;

    // Reuse calculations and memory access
    int out_index_base = (j * sample + h2 * (k + c2 * b));
    int out_index = i * sample + w2 * out_index_base;
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    // Perform the operation
    out[out_index] = s1 * out[out_index] + s2 * add[add_index];
}