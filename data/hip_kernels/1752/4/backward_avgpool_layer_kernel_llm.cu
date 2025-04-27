```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int k = id % c;
    int b = id / c;  // Simplify division

    int out_index = k + c * b;
    int offset = h * w * (k + b * c);
    float scale = out_delta[out_index] / (w * h);  // Calculate scale outside loop

    // Use offset and scale for efficient memory access and calculation
    for (int i = 0; i < w * h; ++i) {
        in_delta[offset + i] += scale;
    }
}