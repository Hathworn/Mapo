#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;
    
    // Precompute commonly used multiplications
    int sample_w2 = sample * w2;
    int stride_w1 = stride * w1;

    int i = id % minw;
    id /= minw;
    int j = id % minh;
    id /= minh;
    int k = id % minc;
    id /= minc;
    int b = id % batch;

    // Improved index calculation with precomputed values
    int out_index = i * sample + sample_w2 * j + h2 * (k + c2 * b);
    int add_index = i * stride + stride_w1 * j + h1 * (k + c1 * b);
    
    // Perform the addition
    atomicAdd(&out[out_index], add[add_index]);  // Use atomic addition to prevent race condition
}