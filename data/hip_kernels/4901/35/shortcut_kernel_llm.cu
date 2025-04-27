#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    // Use shared memory for faster access and reduce redundant calculations
    __shared__ int shared_minw, shared_minh, shared_minc;
    if (threadIdx.x == 0) {
        shared_minw = minw;
        shared_minh = minh;
        shared_minc = minc;
    }
    __syncthreads();

    // Calculate global id more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    // Unroll the division operations to prevent repeated calculations
    int i = id % shared_minw;
    id /= shared_minw;
    int j = id % shared_minh;
    id /= shared_minh;
    int k = id % shared_minc;
    id /= shared_minc;
    int b = id;

    // Optimize memory access by reducing calculation redundancy
    int out_index = (i + sample * (j + w2 * (k + c2 * b))) * w2;
    int add_index = (i * stride + w1 * (j * stride + h1 * (k + c1 * b))) * w1;
    out[out_index] += add[add_index];
}