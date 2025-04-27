#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_avgpool_layer_kernel(int n, int w, int h, int c, float *in_delta, float *out_delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Use 1D grid and block for better indexing
    if(id >= n) return;

    int out_area = w * h;  // Pre-calculate area
    int k = id % c;
    int b = id / c;  // Avoid unnecessary div-mod operations in the loop below

    float scale = out_delta[k + c * b] / out_area;  // Pre-calculate division
    int base_index = h * w * (k + b * c);  // Pre-calculate base index

    for(int i = 0; i < out_area; ++i){
        in_delta[base_index + i] += scale;  // Directly use calculated scale value
    }
}