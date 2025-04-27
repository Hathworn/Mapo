#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    // Compute global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the index is within bounds
    if (id >= size) return;
    
    // Unroll loop to directly compute indices
    int b = id / (minw * minh * minc);
    int k = (id / (minw * minh)) % minc;
    int j = (id / minw) % minh;
    int i = id % minw;
    
    // Compute output and add indices efficiently
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    
    // Accumulate results
    out[out_index] = s1 * out[out_index] + s2 * add[add_index];
}