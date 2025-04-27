#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void input_shortcut_kernel(float *in, int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if outside the bounds
    if (id >= size) return;
    
    // Calculate necessary indices
    int i = id % minw;
    int j = (id / minw) % minh;
    int k = (id / (minw * minh)) % minc;
    int b = id / (minw * minh * minc);
    
    // Use calculated indices to compute output and addition indices
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    
    // Perform addition and store result
    out[out_index] = in[out_index] + add[add_index];
}