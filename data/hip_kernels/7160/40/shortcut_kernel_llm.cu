#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= size) return;
    
    // Unroll division/modulus operations for better performance
    int b = id / (minw * minh * minc);
    int rem = id % (minw * minh * minc);
    int k = rem / (minw * minh);
    rem = rem % (minw * minh);
    int j = rem / minw;
    int i = rem % minw;

    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    
    // Combine operations to minimize memory access
    float add_val = add[add_index];
    out[out_index] = s1 * out[out_index] + s2 * add_val;
}