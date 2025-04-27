#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n * c) return; // Fix index calculation for correct boundary check

    int k = id % c; // Compute channel index
    int b = id / c; // Compute batch index

    int out_index = k + c * b; // Compute output delta index
    float scale = out_delta[out_index] / (w * h); // Precompute scale factor
    
    // Use of a single loop variable
    for(int i = 0; i < w * h; ++i) {
        int in_index = i + w * h * (k + b * c); // Compute input delta index
        in_delta[in_index] += scale; // Apply scaled gradient
    }
}