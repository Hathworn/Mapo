```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function optimized
__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread indexing
    if (id >= size) return;

    // Precompute common terms outside loops
    int minw_stride = minw * stride;
    int minh_stride = minh * stride;
    int minc_stride = minc * stride;

    // Use integer division and modulus only once
    int temp = id;
    int i = temp % minw;
    int j = (temp / minw) % minh;
    int k = (temp / minw_stride) % minc;
    int b = temp / (minw_stride * minc);

    // Calculate indices with simplified expressions
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    // Update output using calculated indices
    out[out_index] += add[add_index];
}