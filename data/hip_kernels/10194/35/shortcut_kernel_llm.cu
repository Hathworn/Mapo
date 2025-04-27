#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Improved grid indexing
    if (id >= size) return;

    // Use integer division and modulus to calculate indices.
    int current_id = id;
    int i = current_id % minw; 
    current_id /= minw;
    int j = current_id % minh; 
    current_id /= minh;
    int k = current_id % minc; 
    current_id /= minc;
    int b = current_id % batch;

    // Calculate output and add indices.
    int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
    int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
    out[out_index] += add[add_index]; // Perform addition
}