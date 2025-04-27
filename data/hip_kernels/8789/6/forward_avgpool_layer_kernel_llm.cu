#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int k = id % c;
    int b = id / c; // Simplified division

    int out_index = k + c * b;
    float sum = 0.0f; // Use local variable for accumulation
    int in_index_base = h * w * (k + b * c); // Precompute base index

    // Efficiently calculate sum using a single loop with precomputed index base
    for(int i = 0; i < w * h; ++i){
        sum += input[in_index_base + i];
    }

    output[out_index] = sum / (w * h); // Single division after accumulation
}