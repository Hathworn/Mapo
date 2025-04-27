#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified id calculation
    if (id >= size) return;

    int temp_id = id;
    int i = temp_id % minw;
    temp_id /= minw;
    int j = temp_id % minh;
    temp_id /= minh;
    int k = temp_id % minc;
    temp_id /= minc;
    int b = temp_id % batch;

    // Combined index calculations
    int out_index = i*sample + w2*(j*sample + h2*(k + c2*b));
    int add_index = i*stride + w1*(j*stride + h1*(k + c1*b));

    // Optimize computation by using fma if possible
    out[out_index] = __fmaf_rn(s1, out[out_index], s2 * add[add_index]);
}