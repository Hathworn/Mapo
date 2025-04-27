#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid and block indexing
    if (id >= size) return;

    // Precompute divisors to reduce recalculation
    int size_minw = size / minw;
    int size_minh = size_minw / minh;
    int size_minc = size_minh / minc;

    int b = id / size_minc;
    id %= size_minc;
    int k = id / size_minh;
    id %= size_minh;
    int j = id / minw;
    int i = id % minw;

    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    atomicAdd(&out[out_index], add[add_index]); // Use atomicAdd for potential race condition
}