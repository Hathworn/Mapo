#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    // Use a 2D block and grid to potentially improve memory coalescing and occupancy
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    int id = idy * (gridDim.x * blockDim.x) + idx; // compute global thread ID
    if (id >= size) return;

    int i = id % minw;
    id /= minw;
    int j = id % minh;
    id /= minh;
    int k = id % minc;
    id /= minc;
    int b = id % batch;

    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    
    // Use registers for temporary storage to optimize memory accesses
    float out_val = s1 * out[out_index];
    float add_val = s2 * add[add_index];

    out[out_index] = out_val + add_val;
}