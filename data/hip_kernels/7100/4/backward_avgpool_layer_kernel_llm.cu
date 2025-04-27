#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using shared memory to reduce repetitive calculations
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;  // Simplified division

    int out_index = k + c * b;
    float out_value = out_delta[out_index] / (w * h);  // Pre-compute division

    int base_in_index = h * w * (k + b * c);
    for(int i = 0; i < w * h; ++i) {
        int in_index = i + base_in_index;
        in_delta[in_index] += out_value;
    }
}