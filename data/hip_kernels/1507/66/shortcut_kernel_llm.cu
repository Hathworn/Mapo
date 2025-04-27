#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Abort if out of bounds
    if (id >= size) return;

    // Optimized index calculations
    int i = id % minw;
    int j = (id / minw) % minh;
    int k = (id / (minw * minh)) % minc;
    int b = id / (minw * minh * minc);

    // Streamlined index calculation
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));

    atomicAdd(&out[out_index], add[add_index]); // Use atomic for concurrent writes
}