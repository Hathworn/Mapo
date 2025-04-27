```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shortcut_kernel(int size, int minw, int minh, int minc, int stride, int sample, int batch, int w1, int h1, int c1, float *add, int w2, int h2, int c2, float *out)
{
    // Calculate unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride of grid to loop over all elements
    for (; id < size; id += gridDim.x * blockDim.x) {
        int i = id % minw;
        int j = (id / minw) % minh;
        int k = (id / (minw * minh)) % minc;
        int b = (id / (minw * minh * minc)) % batch;

        // Compute indices
        int out_index = i * sample + w2 * (j * sample + h2 * (k + c2 * b));
        int add_index = i * stride + w1 * (j * stride + h1 * (k + c1 * b));
        
        // Perform operation
        out[out_index] += add[add_index];
    }
}