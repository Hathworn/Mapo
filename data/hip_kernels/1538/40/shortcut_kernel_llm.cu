#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    if (id < size) { // Efficient check to ensure thread is within bounds
        int i = id % minw;
        int j = (id / minw) % minh;
        int k = (id / (minw * minh)) % minc;
        int b = id / (minw * minh * minc);

        int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
        int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
        out[out_index] = s1 * out[out_index] + s2 * add[add_index]; // Perform operation more succinctly
    }
}