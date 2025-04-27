#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int total_size = w * h;
    int k = id % c;
    int b = id / c; // Use integer division for batch index
    int out_index = k + c * b;
    float scale = out_delta[out_index] / total_size;

    int in_base_index = k + b * c;
    for(int i = threadIdx.y; i < total_size; i += blockDim.y) {
        int in_index = i + h * w * in_base_index; // Calculate index once per loop iteration
        in_delta[in_index] += scale;
    }
}