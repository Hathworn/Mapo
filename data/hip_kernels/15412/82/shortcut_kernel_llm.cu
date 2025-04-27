#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Use integer division and mod in a single step for better performance.
    int temp, i, j, k, b;

    b = id / (minw * minh * minc);
    temp = id % (minw * minh * minc);

    k = temp / (minw * minh);
    temp = temp % (minw * minh);

    j = temp / minw;
    i = temp % minw;

    // Use precomputed indices for better memory alignment.
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    
    atomicAdd(&out[out_index], add[add_index]); // Improved data race handling with atomic operation
}