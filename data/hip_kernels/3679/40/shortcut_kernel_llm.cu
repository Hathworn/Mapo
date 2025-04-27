#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Pre-compute reused indices to enhance performance
    int i = (id % minw) * sample; 
    id /= minw;
    int j = (id % minh) * sample; 
    id /= minh;
    int k = id % minc;
    id /= minc;
    int b = id % batch;

    // Use pre-computed indices for address calculations
    int out_index = i + w2 * (j + h2 * (k + c2 * b));
    int add_index = (i / sample) * stride + w1 * ((j / sample) * stride + h1 * (k + c1 * b));
    
    // Perform operation using new indices
    out[out_index] = s1 * out[out_index] + s2 * add[add_index];
}