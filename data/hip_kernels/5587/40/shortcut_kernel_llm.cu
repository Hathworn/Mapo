```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= size) return;
    
    // Optimize index calculations with pre-computed variables
    int id1 = id / (minw * minh);
    int id2 = id % minw + minw * ((id / minw) % minh);
    
    int b = id1 % batch;
    int k = (id1 / batch) % minc;
    
    int out_index = id2 * sample + w2 * (k + c2 * b);
    int add_index = id2 * stride + w1 * (k + c1 * b);
    
    // Optimize memory access by reducing arithmetic calculations
    float val = s1 * out[out_index];
    out[out_index] = val + s2 * add[add_index];
}