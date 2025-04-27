#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate the global thread ID efficiently
    if (id >= size) return;

    int b = id / (minw * minh * minc);  // Calculate batch index
    int id_rem = id % (minw * minh * minc);
    int k = id_rem / (minw * minh);     // Calculate channel index
    id_rem %= (minw * minh);
    int j = id_rem / minw;              // Calculate height index
    int i = id_rem % minw;              // Calculate width index

    // Calculate the indexes in input/output arrays.
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    // Perform the weighted addition
    out[out_index] = s1 * out[out_index] + s2 * add[add_index];
}