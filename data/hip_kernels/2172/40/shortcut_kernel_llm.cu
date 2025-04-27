#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    // Calculate unique thread identifier
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit if the identifier exceeds the size
    if (id >= size) return;

    // Calculate indices for output and addition matrices
    int i = id % minw;
    int j = (id / minw) % minh;
    int k = (id / (minw * minh)) % minc;
    int b = id / (minw * minh * minc);

    // Calculate position in output and addition arrays
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    // Optimize memory access by reducing arithmetic operations
    float out_val = out[out_index];
    float add_val = add[add_index];
    
    // Update output with weighted addition
    out[out_index] = s1 * out_val + s2 * add_val;
}