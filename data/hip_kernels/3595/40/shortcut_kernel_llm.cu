#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float s1, float s2, float *out)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within bounds using a loop rather than a guard clause for efficiency
    while (id < size) {
        int i = id % minw;
        id /= minw;
        int j = id % minh;
        id /= minh;
        int k = id % minc;
        id /= minc;
        int b = id % batch;

        int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
        int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
        out[out_index] = s1 * out[out_index] + s2 * add[add_index];

        id += blockDim.x * gridDim.x; // Move to next id up to total number of threads
    }
}