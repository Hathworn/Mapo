#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    // Calculate batch and channel from id
    int b = id / c;
    int k = id % c;

    float scale = out_delta[k + c * b] / (w * h); // Precompute scaling factor

    // Use global thread index to process each element
    for(int i = 0; i < w * h; ++i){
        int in_index = i + h * w * (k + b * c);
        in_delta[in_index] += scale; // Use precomputed scaling factor
    }
}