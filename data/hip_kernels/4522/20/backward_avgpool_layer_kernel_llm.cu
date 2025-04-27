#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid and block index calculation
    if(id >= n) return;

    int b = id / c; // Compute batch index
    int k = id % c; // Compute channel index

    int out_index = k + c*b;
    float out_delta_val = out_delta[out_index] / (w*h); // Precompute division

    int offset = h*w*(k + b*c); // Precompute offset
    for(int i = 0; i < w*h; ++i){
        int in_index = i + offset;
        in_delta[in_index] += out_delta_val;
    }
}