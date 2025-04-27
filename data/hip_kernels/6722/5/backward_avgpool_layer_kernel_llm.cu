#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c;

    int out_index = k + c * b;
    float out_delta_val = out_delta[out_index] / (w * h); // Pre-compute division to avoid redundant calculations

    for(int i = 0; i < w * h; ++i){
        int in_index = i + h * w * (k + b * c);
        atomicAdd(&in_delta[in_index], out_delta_val); // Use atomicAdd for safe concurrent writes
    }
}