#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void input_shortcut_kernel(float *in, int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index computation
    int totalThreads = gridDim.x * blockDim.x; // Total threads available

    for (int id = index; id < size; id += totalThreads) { // Loop to allow multiple iterations
        int i = id % minw;
        int j = (id / minw) % minh; // Direct division for j 
        int k = (id / (minw * minh)) % minc; // Direct division for k
        int b = id / (minw * minh * minc); // Direct division for b

        int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
        int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

        out[out_index] = in[out_index] + add[add_index];
    }
}