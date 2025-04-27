#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_avgpool_layer_kernel(int n, int w, int h, int c, float *input, float *output)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int total_elements = w * h;
    int k = id % c;
    int b = id / c;
    int out_index = k + c * b;
    int in_offset = h * w * (k + b * c);

    float sum = 0.0f;
    for(int i = 0; i < total_elements; ++i){
        sum += input[in_offset + i];
    }
    output[out_index] = sum / total_elements;
}